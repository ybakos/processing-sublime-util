#!/usr/bin/env ruby

require 'thor'
require_relative 'syntax_comparator'

class P5ST2Util < Thor

  PROCESSING_API_REFERENCE_URL = "http://processing.org/reference/"

  desc "compare", "Compare the public Processing API reference to a Processing.tmLanguage file."
  def compare(tmlanguage_path)
    puts "Comparing #{PROCESSING_API_REFERENCE_URL} to #{tmlanguage_path}";
    puts SyntaxComparator.new(PROCESSING_API_REFERENCE_URL, tmlanguage_path).diff
  end

end

P5ST2Util.start(ARGV)
