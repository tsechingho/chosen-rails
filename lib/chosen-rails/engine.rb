module Chosen
  module Rails
    class Engine < ::Rails::Engine
      config.assets.precompile += %w(
        chosen-sprite*.png
      )

      rake_tasks do
        load 'chosen-rails/tasks.rake'
      end
    end
  end
end
