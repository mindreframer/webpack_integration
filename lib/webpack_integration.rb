require "webpack_integration/version"
require "webpack_integration/configuration"
require "webpack_integration/assets"
require "webpack_integration/store"
if defined?(Rails)
  require "webpack_integration/railtie"
  require "webpack_integration/view_helper"
end

module WebpackIntegration
  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= WebpackIntegration::Configuration.new
  end

  # @example
  #   WebpackIntergration.file_for('clients.css')
  def self.file_for(filename)
    WebpackIntegration::Store.file_for(filename)
  end

  def self.fuzzy_file_for(file_pattern)
    WebpackIntegration::Store.fuzzy_file_for(file_pattern)
  end

  # should be called in development mode in after-request filter
  def self.reset_assets_manifest!
    WebpackIntegration::Store.reset
  end
end
