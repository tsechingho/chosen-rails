module Chosen
  module Rails
    class Engine < ::Rails::Engine

      initializer "chosen-rails.assets.precompile" do |app|
        app.config.assets.precompile += %w( chosen-sprite*.png )
      end

      rake_tasks do
        load 'chosen-rails/tasks.rake'
      end
    end
  end
end
