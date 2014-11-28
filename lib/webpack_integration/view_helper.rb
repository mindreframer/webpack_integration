module WebpackIntegration
  module ViewHelper
    def webpack_file(filename)
      WebpackIntergration.fuzzy_file_for(filename)
    end
  end
end
