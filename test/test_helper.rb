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


Bundler.setup

require './test/apps/test_rails_app'
require 'webpack_integration'
require 'rack/test'
require 'maxitest'
require 'mocha/mini_test'
require 'maxitest/autorun'
