# frozen_string_literal: true

require_relative "lib/splunk/otel/version"

Gem::Specification.new do |spec|
  spec.name          = "splunk-otel"
  spec.version       = Splunk::Otel::VERSION
  spec.authors       = ["Splunk"]
  spec.email         = ["splunk-oss@splunk.com"]

  spec.summary       = "Splunk OpenTelemetry Ruby distribution"
  spec.homepage      = "https://github.com/signalfx/splunk-otel-ruby"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/signalfx/splunk-otel-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/signalfx/splunk-otel-ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "opentelemetry-api", "~> 1.0"
  spec.add_dependency "opentelemetry-exporter-jaeger", "~> 0.20.1"
  spec.add_dependency "opentelemetry-exporter-otlp", "~> 0.21.0"
  spec.add_dependency "opentelemetry-instrumentation-base", "~> 0.21.0"
  spec.add_dependency "opentelemetry-propagator-b3", "~> 0.19.2"
  spec.add_dependency "opentelemetry-sdk", "~> 1.0"

  # development dependencies
  spec.add_development_dependency "rails"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 1.25"
  spec.add_development_dependency "rubocop-rake", "~> 0.6.0"
  spec.add_development_dependency "simplecov", "~> 0.21.2"
  spec.add_development_dependency "test-unit", "~> 3.0"

  spec.add_development_dependency "opentelemetry-instrumentation-action_pack", "~> 0.2.0"
  spec.add_development_dependency "opentelemetry-instrumentation-rack", "~> 0.21"
  spec.add_development_dependency "rack", "~> 2.2"
  spec.add_development_dependency "rack-test", "~> 2.0"
  spec.add_development_dependency "simplecov-cobertura", "~> 2.1.0"

  spec.metadata = {
    "rubygems_mfa_required" => "true"
  }
end
