module WebpackIntegration
  class Configuration
    attr_accessor :folder_in_public, :reset_on_each_request, :public_folder
    def initialize
      @folder_in_public      = 'webpack'
      @public_folder         = 'public'
      @reset_on_each_request = false
    end

    def full_path
      File.join(public_folder, folder_in_public)
    end
  end
end
