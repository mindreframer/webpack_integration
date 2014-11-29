require 'bundler'

require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
  add_filter "/.direnv/"
end
if ENV['CI']=='true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'pry'
Bundler.setup

require './test/apps/test_rails_app'
require 'webpack_integration'

# we need to initialize application after loading webpack_integration, so railtie hooks run!
Rails.application.initialize!
# somehow the routes are gone after init, but I dont care why, just re-init them
TestRailsApp::Application.routes.draw do
  get  '/view_test' => 'test_rails_app/view_test#index'
end


require 'rack/test'
require 'maxitest'
require 'mocha/mini_test'
require 'maxitest/autorun'
