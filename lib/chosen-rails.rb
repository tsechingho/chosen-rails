require 'chosen-rails/version'

module Chosen
  module Rails
    if ::Rails.version.to_s < '3.1'
      require 'chosen-rails/railtie'
    else
      require 'chosen-rails/engine'
    end
  end
end
