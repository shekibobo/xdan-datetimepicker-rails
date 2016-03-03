require "bundler/gem_tasks"
require "xdan-datetimepicker-rails/version"

require "net/http"
require "open-uri"

namespace :source do
  desc "update the source file"
  task :update do
    old_version = XdanDatetimepickerRails::VERSION
    new_version = ENV["version"] || "master"
    puts "Downloading jquery.datetimepicker.js..."
    download "https://raw.github.com/xdan/datetimepicker/#{new_version}/jquery.datetimepicker.js", "app/assets/javascripts/jquery.xdan.datetimepicker.js"
    puts "Downloading jquery.datetimepicker.full.js..."
    download "https://raw.github.com/xdan/datetimepicker/#{new_version}/build/jquery.datetimepicker.full.js", "app/assets/javascripts/jquery.xdan.datetimepicker.full.js"

    puts "Downloading jquery.datetimepicker.css..."
    download "https://raw.github.com/xdan/datetimepicker/#{new_version}/jquery.datetimepicker.css", "app/assets/stylesheets/jquery.xdan.datetimepicker.css"

    update_version from: old_version, to: new_version

    system "git add app/assets/ lib/xdan-datetimepicker-rails/version.rb"
    system "git commit -m 'Update source to version #{new_version}\n\n[Diff from #{old_version} to #{new_version}](https://www.github.com/xdan/datetimepicker/compare/#{old_version}...#{new_version})'"
    system "git tag #{new_version}"
  end
end

namespace :rubygems do
  desc "build and release new version to rubygems"
  task :release do
    puts "Building xdan-datetimepicker-rails.gemspec"
    system "gem build xdan-datetimepicker-rails.gemspec"
    print "\nPushing xdan-datetimepicker-rails-#{XdanDatetimepickerRails::VERSION} to rubygems..."
    system "gem push xdan-datetimepicker-rails-#{XdanDatetimepickerRails::VERSION}.gem"
    puts "done!"
  end
end

def download(remote_path, local_path)
  `wget -O #{local_path} #{remote_path}`
end

def update_version(from:, to:)
  version_rb = "lib/xdan-datetimepicker-rails/version.rb"
  File.write(version_rb, File.open(version_rb, &:read).gsub(from, to))
end
