# frozen_string_literal: true

require "yaml"
require "date"

module TMT
  module_function

  def root
    File.expand_path("..", __dir__)
  end

  def load_yaml(path)
    YAML.safe_load(File.read(path, encoding: "UTF-8"), permitted_classes: [Date], aliases: true)
  rescue NameError
    YAML.safe_load(File.read(path, encoding: "UTF-8"), [], [], true)
  end

  def frontmatter(path)
    text = File.read(path, encoding: "UTF-8")
    match = text.match(/\A---\s*\n(.*?)\n---\s*\n/m)
    match && YAML.safe_load(match[1], permitted_classes: [Date], aliases: true)
  rescue NameError
    match && YAML.safe_load(match[1], [], [], true)
  end

  def registry(root_path = root)
    load_yaml(File.join(root_path, "System", "REGISTRY.yaml"))
  end
end
