require "rails/generators/rails/task/task_generator"

# Matching implementation from https://github.com/rails/rails/blob/main/railties/test/generators/task_generator_test.rb
RSpec.describe Rails::Generators::TaskGenerator, type: :generator do
  it "creates a task" do
    run_generator Rails::Generators::TaskGenerator, %w[feeds foo bar]

    expect_file("lib/tasks/feeds.rake") do |content|
      expect(content).to match(/namespace :feeds/)
      expect(content).to match(/task foo:/)
      expect(content).to match(/task bar:/)
    end
  end

  it "can revoke a task" do
    run_generator Rails::Generators::TaskGenerator, %w[feeds foo bar]
    expect_file("lib/tasks/feeds.rake")

    run_generator Rails::Generators::TaskGenerator, ["feeds"], behavior: :revoke
    not_expect_file("lib/tasks/feeds.rake")
  end
end
