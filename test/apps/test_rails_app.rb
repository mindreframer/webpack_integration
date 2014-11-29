require 'rails'
require 'action_controller/railtie'

module TestRailsApp
  class Application < Rails::Application
    config.secret_token = '572c86f5ede338bd8aba8dae0fd3a326aabababc98d1e6ce34b9f5'

    routes.draw do
      get  '/view_test' => 'test_rails_app/view_test#index'
    end
  end

  class ViewTestController < ActionController::Base
    before_filter :set_view_path
    def index
      # renders a partial with helpers
    end

    def set_view_path
      self.view_paths.push(File.dirname(__FILE__))
    end
  end
end
