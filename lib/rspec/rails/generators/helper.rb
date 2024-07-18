# frozen_string_literal: true

module Rspec
  module Rails
    module Generators
      def prepare_destination
        FileUtils.rm_rf(destination_root)
        FileUtils.mkdir(destination_root)
      end

      def cleanup_destination
        FileUtils.rm_rf(destination_root)
      end

      # Mimics railties/lib/rails/generators/testing/behaviour.rb
      def run_generator(generator_class, args = default_arguments, config = {})
        args += ["--skip-bundle"] unless args.include?("--no-skip-bundle") || args.include?("--dev")
        args |= ["--skip-bootsnap"] unless args.include?("--no-skip-bootsnap")

        generator_class.start(args, config.reverse_merge(destination_root: destination_root))
      end

      def expect_file(file_path)
        destination_file_path = "#{destination_root}/#{file_path}"
        expect(File).to exist(destination_file_path)
        return unless block_given?

        yield File.read(destination_file_path)
      end

      def not_expect_file(file_path)
        destination_file_path = "#{destination_root}/#{file_path}"
        expect(File).not_to exist(destination_file_path)
      end

      private

      def destination_root
        RSpec.configuration.generators_default_destination_path
      end
    end
  end
end
