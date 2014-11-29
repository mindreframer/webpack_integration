module WebpackIntegration
  module ViewHelper
    def webpack_file(filename)
      WebpackIntegration.fuzzy_file_for(filename)
    end
  end
end
