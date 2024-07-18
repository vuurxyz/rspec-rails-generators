require "support/generators/example/example_generator"

RSpec.describe ExampleGenerator, type: :generator do
  it "generates the model file" do
    run_generator(ExampleGenerator, ["Point"])
    expect_file("app/models/point.rb") do |content|
      expect(content).to match(/class Point/)
      expect(content).to match(/include ActiveModel::Model/)
    end
  end

  it "generates the model test file" do
    run_generator ExampleGenerator, ["Point"]

    expect_file "test/models/point_test.rb" do |content|
      expect(content).to match(/class PointTest < ActiveSupport::TestCase/)
    end
  end

  it "supports specifying attr_accessor fields for the model" do
    run_generator ExampleGenerator, %w[Point x y]

    expect_file "app/models/point.rb" do |content|
      expect(content).to match(/attr_accessor :x, :y/)
    end
  end

  it "supports specifying --active-model for the model" do
    run_generator ExampleGenerator, %w[Point x y --active-model]

    expect_file "app/models/point.rb" do |content|
      expect(content).to match(/include ActiveModel::Model/)
    end
  end

  it "supports specifying or --no-active-model for the model" do
    run_generator ExampleGenerator, %w[Point x y --no-active-model]

    expect_file "app/models/point.rb" do |content|
      expect(content).not_to match(/include ActiveModel::Model/)
    end
  end
end
