require 'YAML'
require 'JSON'

class Formula
  def method_missing(method_name, *args); end
  def self.method_missing(method_name, *args); end
  def build; Formula.new; end
  def self.build; Formula.new; end
  def self.test; end
end

namespace :modules do

  desc "Build _data directory"
  task :generate do
    tmp_dir = "/tmp/homebrew-nginx-generate"
    git_url = "https://github.com/Homebrew/homebrew-nginx.git"
    if Dir.exists? tmp_dir
      Dir.chdir(tmp_dir) do
        sh "git fetch origin"
        sh "git pull origin master"
      end
    else
      sh "git clone #{git_url} #{tmp_dir}"
    end

    module_data = {}
    modules = []

    $LOAD_PATH.unshift File.expand_path(tmp_dir)
    FileUtils.touch "#{tmp_dir}/formula.rb"
    require "#{tmp_dir}/Formula/nginx-full.rb"
    NginxFull.core_modules.each do |arr|
      module_data[arr[0]] = arr[2]
    end
    NginxFull.third_party_modules.each do |name, desc|
      module_data[name] = desc
    end

    module_data.each do |name, desc|
      filename = "#{tmp_dir}/Formula/#{name}-nginx-module.rb"
      if File.exists? filename
        contents = File.open(filename) { |f| f.read }
        match = /homepage [\"'](.*)[\"']/.match(contents)
        homepage = match[1]
        match = /sha256 [\"'](.*)[\"']/.match(contents)
        sha256 = match[1]
        match = /version [\"'](.*)[\"']/.match(contents)
        version = match[1] if match
        unless version
          match = /\/v?([0-9\.]+)\.tar\.gz/.match(contents)
          version = match[1] if match
        end
      else
        sha256 = nil
        homepage = nil
        version = 'master'
      end
      version = sha256[0..6] unless version
      modules.push({
        'name' => name,
        'homepage' => homepage,
        'version' => version,
        'sha256' => sha256,
        'description' => desc
      })
    end
    modules.sort_by! do |m|
      m['name']
    end
    File.open('_data/modules.yml', 'w') do |f|
      YAML.dump(modules, f)
    end

    # Cleanup
    #if Dir.exists? tmp_dir
    #  Dir.chdir(tmp_dir) do
    #    FileUtils.rm_r(tmp_dir, :force => true)
    #  end
    #end

  end
end
