require 'chosen-rails/version'

module Chosen
  module Rails
    case ::Rails.version.to_s
    when /^4/
      require 'chosen-rails/engine'
    when /^3\.[12]/
      require 'chosen-rails/engine3'
    when /^3\.[0]/
      require 'chosen-rails/railtie'
    end
  end
end
