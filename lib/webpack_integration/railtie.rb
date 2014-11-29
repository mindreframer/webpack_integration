module WebpackIntegration
  class Railtie < Rails::Railtie
    initializer "webpack_integration.configure_rails_initialization" do |app|
      ActiveSupport.on_load :action_view do
        include WebpackIntegration::ViewHelper
      end
    end

    # Add a to_prepare block which is executed once in production
    # and before each request in development
    config.to_prepare do
      WebpackIntegration.reset_assets_manifest!
    end
  end
end
