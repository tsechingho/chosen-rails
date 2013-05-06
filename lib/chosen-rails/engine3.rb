module Chosen
  module Rails
    class Engine3 < ::Rails::Engine
      initializer 'chosen.assets.precompile' do |app|
        app.config.assets.precompile += %w(
          chosen-sprite*.png
        )
      end
    end
  end
end
