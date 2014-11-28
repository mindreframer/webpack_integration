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
      File.join(configuration.full_path, '**/**/**/**')
    end

    def self.webpack_folder
      configuration.full_path
    end

    def self.public_folder
      configuration.public_folder
    end

    def self.configuration
      WebpackIntegration.configuration
    end
  end
end
