 module Jekyll
  module HideCustomBibtex
    def hideCustomBibtex(input)
	  keywords = @context.registers[:site].config['filtered_bibtex_keywords']

	  keywords.each do |keyword|
		input = input.gsub(/^.*#{keyword}.*$\n/, '')
	  end

	  # The venue @string values carry display markup and a trailing comma for
	  # the periodical line, neither of which belongs in copyable BibTeX.
	  input = input.gsub(/<[^>]+>/, '')
	  input = input.gsub(/,[ \t]*\}(,?)[ \t]*$/, '}\1')

      return input
    end
  end
end

Liquid::Template.register_filter(Jekyll::HideCustomBibtex)
