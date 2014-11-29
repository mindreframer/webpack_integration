require './test/test_helper'

describe 'WebpackIntegration::Railtie' do
  before do
    WebpackIntegration.configure do |config|
      config.public_folder    = 'test/fixtures'
      config.folder_in_public = 'webpack'
    end
  end

  describe 'view_helper in views' do
    include Rack::Test::Methods
    def app
      Rails.logger = Logger.new(STDOUT)
      TestRailsApp::Application
    end

    it "works" do
      get '/view_test'
      assert last_response.ok?
      last_response.body.must_equal "/webpack/common-2e7d2c0.js\n/webpack/common-2e7d2c0.js"
    end

  end
end
