require "chosen-rails/version"

module Chosen
  module Rails
    if ::Rails.version < "3.1"
      require "chosen-rails/railtie"
    else
      require "chosen-rails/engine"
    end
  end
end
