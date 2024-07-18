require "rails/generators"

class ExampleGenerator < Rails::Generators::NamedBase
  argument :attributes, type: :array, default: [], banner: "attribute attribute"
  class_option :active_model, type: :boolean, default: true

  source_root File.expand_path("templates", __dir__)

  def create_model_file
    template "model.rb", File.join("app/models", "#{file_name}.rb")
  end

  def create_model_test_file
    template "model_test.rb", File.join("test/models", "#{file_name}_test.rb")
  end

  private

  def active_model?
    options[:active_model]
  end
end
