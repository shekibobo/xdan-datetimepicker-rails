require "bundler/gem_tasks"
require "xdan-datetimepicker-rails/version"

require "net/http"
require "open-uri"

namespace :source do
  desc "update the source file"
  task :update do
    version = ENV["version"] || "master"
    puts "Downloading jquery.datetimepicker.js..."
    download "https://raw.github.com/xdan/datetimepicker/#{version}/jquery.datetimepicker.js", "app/assets/javascripts/jquery.xdan.datetimepicker.js"

    puts "Downloading jquery.datetimepicker.css..."
    download "https://raw.github.com/xdan/datetimepicker/#{version}/jquery.datetimepicker.css", "app/assets/stylesheets/jquery.xdan.datetimepicker.css"

    update_version version
  end
end

def download(remote_path, local_path)
  `wget -O #{local_path} #{remote_path}`
end

def update_version(new_version)
  version_rb = "lib/xdan-datetimepicker-rails/version.rb"
  File.write(version_rb, File.open(version_rb, &:read).gsub(XdanDatetimepickerRails::VERSION, new_version))
end
