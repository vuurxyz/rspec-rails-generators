# frozen_string_literal: true

RSpec.configure do |config|
  config.add_setting :generators_default_destination_path
end

module Rspec
  module Rails
    module Generators
      RSpec.configure do |config|
        config.before(:each, type: :generator) do
          prepare_destination
          allow($stdout).to receive(:write) unless ENV["RAILS_LOG_TO_STDOUT"] == "true"
        end

        config.after(:all, type: :generator) do
          cleanup_destination
        end
      end
    end
  end
end
