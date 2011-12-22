#!/usr/bin/env rake
require "bundler/gem_tasks"
require File.expand_path('../lib/chosen-rails/source_file', __FILE__)

desc "Update with Harvest's Chosen Library"
task "update-chosen" do
  files = SourceFile.new
  files.fetch
  files.convert
  files.cleanup
end
