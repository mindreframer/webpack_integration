module WebpackIntegration
  module ViewHelper
    def webpack_fuzzy_file(filename)
      WebpackIntegration.fuzzy_file_for(filename)
    end

    def webpack_file(filename)
      WebpackIntegration.file_for(filename)
    end
  end
end
