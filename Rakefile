require "bundler/gem_tasks"

require 'net/http'
require 'open-uri'

namespace :source do
  desc "update the source file"
  task :update do
    puts "Downloading jquery.datetimepicker.js..."
    download "https://raw.github.com/xdan/datetimepicker/master/jquery.datetimepicker.js", "app/assets/javascripts/jquery.xdan.datetimepicker.js"

    puts "Downloading jquery.datetimepicker.css..."
    download "https://raw.github.com/xdan/datetimepicker/master/jquery.datetimepicker.css", "app/assets/stylesheets/jquery.xdan.datetimepicker.css"
  end
end


def download remote_path, local_path
  `wget -O #{local_path} #{remote_path}`
  # File.open(local_path, "wb") do |saved_file|
  #   # the following "open" is provided by open-uri
  #   open(remote_path, "rb") do |read_file|
  #     saved_file.write(read_file.read)
  #   end
  # end
end
