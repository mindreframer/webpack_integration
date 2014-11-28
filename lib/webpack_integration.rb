require "webpack_integration/version"
require "webpack_integration/configuration"
require "webpack_integration/assets"
require "webpack_integration/store"
require "webpack_integration/railtie" if defined?(Rails)


module WebpackIntergration
  def self.configuration
    @configuration ||= WebpackIntergration::Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  # @example
  #   WebpackIntergration.file_for('clients.css')
  def self.file_for(filename)
    WebpackIntergration::Store.file_for(filename)
  end

  def self.fuzzy_file_for(file_pattern)
    WebpackIntergration::Store.fuzzy_file_for(filename)
  end

  # should be called in development mode in after-request filter
  def self.reset_assets_manifest!
    WebpackIntergration::Store.reset
  end
end
