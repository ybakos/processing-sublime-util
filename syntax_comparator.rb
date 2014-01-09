class SyntaxComparator

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
      %w(a b e)
    end

end