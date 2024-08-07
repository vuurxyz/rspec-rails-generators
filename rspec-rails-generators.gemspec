# frozen_string_literal: true

require_relative "lib/rspec/rails/generators/version"

Gem::Specification.new do |spec|
  spec.name = "rspec-rails-generators"
  spec.version = Rspec::Rails::Generators::VERSION
  spec.authors = ["lonnv"]
  spec.email = ["hey@vuur.xyz"]

  spec.summary = "A solution to support Rails Generator testing in RSpec."
  spec.homepage = "https://github.com/vuurxyz/rspec-rails-generators"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/vuurxyz/rspec-rails-generators/blob/main/CHANGELOG.md."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", [">= 3.0.0"]
  spec.add_dependency "railties", [">= 3.0.0"]
  spec.add_development_dependency "rspec-rails"
end
