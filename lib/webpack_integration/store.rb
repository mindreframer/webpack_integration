module WebpackIntegration
  class Store

    # @example
    #   Store.fuzzy_file_for('client.png')
    def self.fuzzy_file_for(file_pattern)
      alternatives = assets_keys.grep(Regexp.new(file_pattern))
      raise "TOO MANY MATCHES for #{file_pattern}" if alternatives.size > 1
      file_for(alternatives.first)
    end

    def self.file_for(filename)
      assets_manifest.fetch(filename) # will raise on missing assets!
    end

    def self.load
      assets_keys
    end

    def self.assets_keys
      @assets_keys ||= assets_manifest.keys.sort!
    end

    def self.assets_manifest
      @assets_manifest ||= WebpackIntegration::Assets.generate_assets_manifest
    end

    def self.reset
      @assets_manifest = nil
      @assets_keys     = nil
    end
  end
end
