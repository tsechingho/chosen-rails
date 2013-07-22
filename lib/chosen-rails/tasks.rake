require 'fileutils'

desc 'Create nondigest versions of all chosen digest assets'
task 'assets:precompile' do
  fingerprint = /\-[0-9a-f]{32}\./
  Dir['public/assets/chosen-*'].each do |file|
    next unless file =~ fingerprint
    nondigest = file.sub fingerprint, '.'
    FileUtils.cp file, nondigest, verbose: true
  end
end
