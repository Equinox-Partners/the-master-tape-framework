#!/usr/bin/env ruby
# frozen_string_literal: true

require "set"
require "date"
require_relative "tmt"

root = File.expand_path(ARGV[0] || TMT.root)
schema = TMT.load_yaml(File.join(root, "System", "schemas", "information-unit.schema.yaml"))
entries = TMT.registry(root).fetch("information", [])
errors = []
documents = {}

entries.group_by { |entry| entry["id"] }.each do |id, rows|
  errors << "duplicate registry ID: #{id}" if rows.length > 1
end

entries.each do |entry|
  path = File.join(root, entry.fetch("canonical_path"))
  unless File.file?(path)
    errors << "missing registry path: #{entry['canonical_path']}"
    next
  end
  data = TMT.frontmatter(path)
  errors << "registry ID mismatch: #{entry['canonical_path']}" unless data && data["id"] == entry["id"]
end

Dir.glob(File.join(root, "{System,Examples}", "**", "*.md")).sort.each do |path|
  data = TMT.frontmatter(path)
  next unless data
  relative = path.delete_prefix("#{root}/")
  missing = schema.fetch("required").reject { |field| data.key?(field) }
  errors << "#{relative}: missing #{missing.join(', ')}" unless missing.empty?

  {
    "type" => "allowed_types",
    "lifecycle_status" => "allowed_lifecycle_statuses",
    "confidence" => "allowed_confidence",
    "sensitivity" => "allowed_sensitivity"
  }.each do |field, allowed|
    errors << "#{relative}: invalid #{field}" unless schema.fetch(allowed).include?(data[field])
  end

  authority = data["authority"] || {}
  errors << "#{relative}: invalid authority domain" unless schema.fetch("allowed_authority_domains").include?(authority["domain"])
  errors << "#{relative}: invalid authority level" unless schema.fetch("allowed_authority_levels").include?(authority["level"])
  errors << "#{relative}: revision must be positive" unless data["revision"].is_a?(Integer) && data["revision"].positive?

  if data["type"] == "project"
    errors << "#{relative}: invalid operational_status" unless schema.fetch("project_operational_statuses").include?(data["operational_status"])
    errors << "#{relative}: active_decisions must be an array" unless data["active_decisions"].is_a?(Array)
  end

  id = data["id"]
  errors << "duplicate document ID: #{id}" if documents.key?(id)
  documents[id] = [relative, data]
end

registry_ids = entries.map { |entry| entry["id"] }.to_set
documents.each do |id, (relative, data)|
  errors << "active document missing from registry: #{id}" if data["lifecycle_status"] == "active" && !registry_ids.include?(id)
  Array(data["relationships"]).each do |relationship|
    errors << "#{relative}: invalid relationship type" unless schema.fetch("allowed_relationships").include?(relationship["type"])
    errors << "#{relative}: unresolved relationship #{relationship['target']}" unless documents.key?(relationship["target"])
  end
end

if errors.empty?
  puts "PASS: #{documents.length} documents, #{entries.length} registry entries"
  exit 0
end

warn "FAIL: #{errors.length} validation error(s)"
errors.each { |error| warn "- #{error}" }
exit 1
