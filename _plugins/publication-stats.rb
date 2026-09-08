# frozen_string_literal: true

module Jekyll
  class PublicationStatsGenerator < Generator
    safe true
    priority :low

    PATENT_FIELDS = %w[abbr journal type howpublished].freeze

    def generate(site)
      scholar = site.config.fetch("scholar", {})
      source = scholar.fetch("source", "_bibliography").to_s.sub(%r{\A/+}, "")
      bibliography = scholar.fetch("bibliography", "papers.bib")
      bibliography_path = site.in_source_dir(source, bibliography)

      counts = Hash.new { |hash, year| hash[year] = { "papers" => 0, "patents" => 0 } }

      bibtex_entries(File.read(bibliography_path, encoding: "UTF-8")).each do |entry|
        year = field_value(entry, "year")&.match(/\b(?:19|20)\d{2}\b/)&.to_s
        next unless year

        category = patent?(entry) ? "patents" : "papers"
        counts[year][category] += 1
      end

      years = counts.keys.sort
      papers = years.map { |year| counts[year]["papers"] }
      patents = years.map { |year| counts[year]["patents"] }

      site.data["publication_stats"] = {
        "years" => years,
        "papers" => papers,
        "patents" => patents,
        "paper_total" => papers.sum,
        "patent_total" => patents.sum,
        "total" => papers.sum + patents.sum
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

    def patent?(entry)
      entry.match?(/^@patent\s*\{/i) || PATENT_FIELDS.any? do |field|
        field_value(entry, field)&.match?(/\bpatent\b/i)
      end
    end

    def empty_stats
      {
        "years" => [],
        "papers" => [],
        "patents" => [],
        "paper_total" => 0,
        "patent_total" => 0,
        "total" => 0
      }
    end
  end
end
