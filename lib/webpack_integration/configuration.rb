module WebpackIntegration
  class Configuration
    attr_accessor :folder_in_public, :public_folder
    def initialize
      @folder_in_public = 'webpack'
      @public_folder    = 'public'
    end

    def full_path
      File.join(public_folder, folder_in_public)
    end
  end
end
