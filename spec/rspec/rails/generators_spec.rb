# frozen_string_literal: true

RSpec.describe Rspec::Rails::Generators do
  it "has a version number" do
    expect(Rspec::Rails::Generators::VERSION).not_to be nil
  end

  context "within the generator context", type: :generator do
    it "prepares the temp generators directory" do
      generators_temp_path = RSpec.configuration.generators_default_destination_path

      expect(Dir.exist?(generators_temp_path)).to be(true)
    end
  end

  it "does not prepare the temp generators directory by default" do
    generators_temp_path = RSpec.configuration.generators_default_destination_path

    expect(Dir.exist?(generators_temp_path)).to be(false)
  end
end
