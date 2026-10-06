# frozen_string_literal: true

module Jekyll
  class PublicationStatsGenerator < Generator
    safe true
    priority :low

    CATEGORY_KEYS = {
      "journal article" => "journal_articles",
      "conference paper" => "conference_papers",
      "patent" => "patents"
    }.freeze

    def generate(site)
      scholar = site.config.fetch("scholar", {})
      source = scholar.fetch("source", "_bibliography").to_s.sub(%r{\A/+}, "")
      bibliography = scholar.fetch("bibliography", "papers.bib")
      bibliography_path = site.in_source_dir(source, bibliography)

      counts = Hash.new do |hash, year|
        hash[year] = CATEGORY_KEYS.values.to_h { |category| [category, 0] }
      end

      bibtex_entries(File.read(bibliography_path, encoding: "UTF-8")).each do |entry|
        year = field_value(entry, "year")&.match(/\b(?:19|20)\d{2}\b/)&.to_s
        next unless year

        category_name = field_value(entry, "category")&.strip&.downcase
        category = CATEGORY_KEYS[category_name]
        unless category
          entry_key = entry[/^@\w+\s*\{\s*([^,]+)/i, 1] || "unknown entry"
          Jekyll.logger.warn "Publication stats:", "#{entry_key} has an invalid or missing category"
          next
        end

        counts[year][category] += 1
      end

      years = counts.keys.sort
      journal_articles = years.map { |year| counts[year]["journal_articles"] }
      conference_papers = years.map { |year| counts[year]["conference_papers"] }
      patents = years.map { |year| counts[year]["patents"] }

      site.data["publication_stats"] = {
        "years" => years,
        "journal_articles" => journal_articles,
        "conference_papers" => conference_papers,
        "patents" => patents,
        "journal_article_total" => journal_articles.sum,
        "conference_paper_total" => conference_papers.sum,
        "patent_total" => patents.sum,
        "total" => journal_articles.sum + conference_papers.sum + patents.sum
      }
    rescue Errno::ENOENT => error
      Jekyll.logger.warn "Publication stats:", error.message
      site.data["publication_stats"] = empty_stats
    end

    private

    def bibtex_entries(content)
      content.split(/(?=^@\w+\s*\{)/i).select { |entry| entry.match?(/^@\w+\s*\{/i) }
    end

    def field_value(entry, field)
      match = entry.match(/^\s*#{Regexp.escape(field)}\s*=\s*(?:\{([^}]*)\}|"([^"]*)"|([^,\n]+))/i)
      match && (match[1] || match[2] || match[3])
    end

    def empty_stats
      {
        "years" => [],
        "journal_articles" => [],
        "conference_papers" => [],
        "patents" => [],
        "journal_article_total" => 0,
        "conference_paper_total" => 0,
        "patent_total" => 0,
        "total" => 0
      }
    end
  end
end
