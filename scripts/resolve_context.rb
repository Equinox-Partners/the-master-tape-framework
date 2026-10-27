#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require_relative "tmt"

args = ARGV.map { |arg| arg.dup.force_encoding(Encoding::UTF_8) }
selector = args.first == "--candidates" ? args[1] : args[0]
unless selector
  warn "Usage: resolve_context.rb [--candidates] <exact-id-title-or-alias> [root]"
  exit 2
end

root = File.expand_path(args.first == "--candidates" ? (args[2] || TMT.root) : (args[1] || TMT.root))
matches = TMT.registry(root).fetch("information", []).select do |entry|
  ([entry["id"], entry["title"]] + Array(entry["aliases"])).include?(selector)
end

result = {
  "selector" => selector,
  "candidate_count" => matches.length,
  "candidates" => matches.map do |entry|
    entry.slice("id", "type", "title", "lifecycle_status", "canonical_path")
  end
}
puts JSON.pretty_generate(result)
