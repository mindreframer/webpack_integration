module WebpackIntegration
  class Assets
    def self.generate_assets_manifest
      {}.tap do |res|
        Dir[file_matcher].each do |f|
          next if File.directory?(f)
          key      = f.gsub(webpack_folder, '')
          key      = key.gsub(/-[a-f\d]*(\.)/, '.') # remove md5 hash
          value    = f.sub(public_folder, '')
          res[key] = value
        end
      end
    end

    def self.file_matcher
      File.join(Configuration.full_path, '**/**/**/**')
    end

    def webpack_folder
      Configuration.full_path
    end

    def public_folder
      Configuration.public_folder
    end
  end
end
