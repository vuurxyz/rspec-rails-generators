# frozen_string_literal: true

require "pry"
require "rails/all"
require "rspec/rails"
require "rspec/rails/generators"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.generators_default_destination_path = File.expand_path("tmp/generators", Dir.pwd)
  config.include Rspec::Rails::Generators, type: :generator
end
