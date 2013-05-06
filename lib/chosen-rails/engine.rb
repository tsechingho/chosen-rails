module Chosen
  module Rails
    class Engine < ::Rails::Engine
      config.assets.precompile += %w(
        chosen-sprite*.png
      )
    end
  end
end
