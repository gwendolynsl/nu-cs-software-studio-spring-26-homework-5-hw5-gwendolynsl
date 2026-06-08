# frozen_string_literal: true

require "simplecov"

resultset = File.join("coverage", ".resultset.json")

unless File.exist?(resultset)
  warn "Coverage result not found at #{resultset}"
  exit 1
end

SimpleCov.collate [ resultset ], "rails" do
  add_filter "/spec/"
  add_filter "/features/"

  minimum_coverage 80
end
