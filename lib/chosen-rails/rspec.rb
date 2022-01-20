module Chosen
  module Rspec
    module FeatureHelpers
      def chosen_select(value, *args)
        options = args.extract_options!

        input = chosen_input(options)

        args.unshift(value).uniq.each { |item| chosen_select!(input, item) }
      end

      def chosen_unselect(value, *args)
        options = args.extract_options!

        input = chosen_input(options)

        args.unshift(value).uniq.each { |item| chosen_unselect!(input, item) }
      end

      private

      def chosen_input(options)
        fail ArgumentError, 'Required argument from: not set' unless options.has_key?(:from)

        from = options.delete(:from)

        begin
          input = chosen_find_container(from, options)
        rescue Capybara::ElementNotFound
          input = chosen_find_input(from, options)
        end
      end

      def chosen_find_container(from, options)
        from = from.to_s

        id = from.underscore
        id = "##{id}" unless from.start_with?('#')
        id = "#{id}_chosen" unless from.end_with?('_chosen')

        find(:css, id, **options)
      rescue Capybara::ElementNotFound
        label = find('label', **{ text: from }.merge(options))

        find(:css, "##{label[:for].underscore}_chosen", **options)
      end

      def chosen_find_input(from, options)
        from = from.to_s
        from = "##{from}" unless from.start_with?('#')

        find(:css, from.underscore, **options)
      end

      def chosen_multiselect?(input)
        input.first('.chosen-container-multi').present?
      end

      def chosen_select!(input, item)
        if input.tag_name == 'select'
          input.find(:option, item).select_option
        else
          input.click

          within "##{input[:id]} .chosen-drop .chosen-results" do
            result = find('.active-result', text: item, match: :prefer_exact)

            result.click if result.visible?
          end
        end
      end

      def chosen_unselect!(input, item)
        if input.tag_name == 'select'
          input.find(:option, item).unselect_option
        else
          if chosen_multiselect?(input)
            input.first('.search-choice', text: item)
              .first('.search-choice-close')
              .click
          else
            input.first('.search-choice-close').click
          end
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.include Chosen::Rspec::FeatureHelpers, type: :system
  config.include Chosen::Rspec::FeatureHelpers, type: :feature
end
