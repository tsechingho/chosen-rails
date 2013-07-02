require 'thor'
require 'json'

class SourceFile < Thor
  include Thor::Actions

  desc 'fetch source files', 'fetch source files from GitHub'
  def fetch remote, branch
    self.destination_root = 'vendor/assets'
    get "#{remote}/raw/#{branch}/public/chosen-sprite.png", 'images/chosen-sprite.png'
    get "#{remote}/raw/#{branch}/public/chosen-sprite@2x.png", 'images/chosen-sprite@2x.png'
    get "#{remote}/raw/#{branch}/public/chosen.css", 'stylesheets/chosen.css'
    get "#{remote}/raw/#{branch}/coffee/lib/abstract-chosen.coffee", 'javascripts/lib/abstract-chosen.coffee'
    get "#{remote}/raw/#{branch}/coffee/lib/select-parser.coffee", 'javascripts/lib/select-parser.coffee'
    get "#{remote}/raw/#{branch}/coffee/chosen.jquery.coffee", 'javascripts/chosen.jquery.coffee'
    get "#{remote}/raw/#{branch}/coffee/chosen.proto.coffee", 'javascripts/chosen.proto.coffee'
    get "#{remote}/raw/#{branch}/package.json", 'package.json'
    bump_version
  end

  desc 'convert css to sass file', 'convert css to sass file by sass-convert'
  def convert
    self.destination_root = 'vendor/assets'
    inside destination_root do
      run('sass-convert -F css -T sass stylesheets/chosen.css stylesheets/chosen.css.sass')
      gsub_file 'stylesheets/chosen.css.sass', '(chosen-sprite.png)', "('chosen-sprite.png')"
      gsub_file 'stylesheets/chosen.css.sass', '(chosen-sprite@2x.png)', "('chosen-sprite@2x.png')"
      gsub_file 'stylesheets/chosen.css.sass', ' url', ' image-url'
    end
  end

  desc 'clean up useless files', 'clean up useless files'
  def cleanup
    self.destination_root = 'vendor/assets'
    remove_file 'stylesheets/chosen.css'
    remove_file 'package.json'
  end

  protected

  def bump_version
    inside destination_root do
      package_json = JSON.load(File.open('package.json'))
      version = package_json['version']
      gsub_file '../../lib/chosen-rails/version.rb', /CHOSEN_VERSION\s=\s'(\d|\.)+'$/ do |match|
        %Q{CHOSEN_VERSION = '#{version}'}
      end
    end
  end
end
