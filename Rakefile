require 'yaml'

namespace :modules do

    desc "Build _data directory"
    task :generate do
      tmp_dir = "/tmp/homebrew-nginx-generate"
      git_url = "https://github.com/marcqualie/homebrew-nginx.git"
      if Dir.exists? tmp_dir
        Dir.chdir(tmp_dir) do
          sh "git fetch origin"
          sh "git pull origin master"
        end
      else
        sh "git clone #{git_url} #{tmp_dir}"
      end
      modules = []
      Dir["#{tmp_dir}/*-module.rb"].each do |filename|
        contents = File.open(filename) { |f| f.read }
        match = /\/([a-z0-9\-]+)\-nginx\-module\.rb/.match(filename)
        name = match[1]
        match = /url [\"'](.*)[\"']/.match(contents)
        url = match[1]
        match = /sha1 [\"'](.*)[\"']/.match(contents)
        sha1 = match[1]
        match = /version [\"'](.*)[\"']/.match(contents)
        version = match[1] if match
        unless version
          match = /\/v?([0-9\.]+)\.tar\.gz/.match(contents)
          version = match[1] if match
        end
        version = sha1[0..6] unless version
        modules.push({
          'name' => name,
          'version' => version,
          'sha1' => sha1,
          'description' => ""
        })
      end
      File.open('_data/modules.yml', 'w') do |f|
        YAML.dump(modules, f)
      end
    end

end
