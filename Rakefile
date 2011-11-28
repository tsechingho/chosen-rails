#!/usr/bin/env rake
require "bundler/gem_tasks"
require "thor"

class SourceFile < Thor
  include Thor::Actions

  desc "fetch source files", "fetch source files from GitHub"
  def fetch
    self.destination_root = "vendor/assets"
    remote = "https://github.com/harvesthq/chosen"
    get "#{remote}/raw/master/chosen/chosen-sprite.png", "images/chosen-sprite.png"
    get "#{remote}/raw/master/chosen/chosen.css", "stylesheets/chosen.css"
    get "#{remote}/raw/master/coffee/lib/abstract-chosen.coffee", "javascripts/lib/abstract-chosen.coffee"
    get "#{remote}/raw/master/coffee/lib/select-parser.coffee", "javascripts/lib/select-parser.coffee"
    get "#{remote}/raw/master/coffee/chosen.jquery.coffee", "javascripts/chosen.jquery.coffee"
    get "#{remote}/raw/master/coffee/chosen.proto.coffee", "javascripts/chosen.proto.coffee"
    get "#{remote}/raw/master/VERSION", "VERSION"
    inside destination_root do
      version = File.read("VERSION").sub("\n", "")
      gsub_file "../../lib/chosen-rails/version.rb", /VERSION\s=\s"(\d|\.)+"$/ do |match|
        %Q{VERSION = "#{version}"}
      end
    end
  end

  desc "convert css to sass file", "convert css to sass file by sass-convert"
  def convert
    self.destination_root = "vendor/assets"
    inside destination_root do
      run("sass-convert -F css -T sass stylesheets/chosen.css stylesheets/chosen.css.sass")
    end
  end

  desc "clean up useless files", "clean up useless files"
  def cleanup
    self.destination_root = "vendor/assets"
    remove_file "stylesheets/chosen.css"
    remove_file "VERSION"
  end
end

desc "Update Harvest's Chosen Library"
task "update-chosen" do
  files = SourceFile.new
  files.fetch
  files.convert
  files.cleanup
end
