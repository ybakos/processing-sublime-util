require 'nokogiri'

class SyntaxComparator

  XML_NODE_NAME = "string" # Typically "string", which wraps the regex you're after.
  SYNTAX_ELEMENT_INDEX = 6 # There are lots of these nodes, so which one do you want?
                           # There's got to be a better way to do this...
  EXTRACTION_REGEX = /\\b\((.*)\)\\b/
  SPLIT_CHARACTER = '|'

  def initialize(api_url, tm_language_path)
    @api_url = api_url
    @tm_language_path = tm_language_path
  end

  def diff
    api_words = parse_api_words
    package_syntax_words = parse_package_syntax_words
    result = "Missing in package syntax definition:\n#{api_words - package_syntax_words}\n\n"
    result += "Defined in package but not in API:\n#{package_syntax_words - api_words}\n"
    return result
  end

  private

    def parse_api_words
      %w(a b c)
    end

    def parse_package_syntax_words
      contents = File.open(@tm_language_path, "r") { |file| to_keyword_list(file) }
    end

    def to_keyword_list(file)
      extract_keywords_from_xml(Nokogiri::XML(file))
    end

    # Highly sensitive to the structure of the tmLanguage xml tree
    def extract_keywords_from_xml(xml)
      xml_content = xml.css(XML_NODE_NAME)[SYNTAX_ELEMENT_INDEX].to_s
      xml_content.match(EXTRACTION_REGEX)[1].split(SPLIT_CHARACTER)
    end

end