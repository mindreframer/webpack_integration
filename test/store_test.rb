require './test/test_helper'

describe 'WebpackIntegration::Store' do
  before do
    WebpackIntegration.configure do |config|
      config.public_folder    = 'test/fixtures'
      config.folder_in_public = 'webpack'
    end
  end

  describe 'load' do
    it "can be loaded" do
      WebpackIntegration::Store.load
    end
  end

  describe 'assets_keys' do
    it "works" do
      WebpackIntegration::Store.assets_keys
    end

    it "contains cleaned up file names, that you want to use in your application" do
      expected = ["/brand_view-bundle.js", "/brand_view_styles-bundle.js", "/common.js", "/executive_view-bundle.js", "/executive_view_styles-bundle.js", "/img/logo.png", "/img/logo_for_runaways.png"]
      WebpackIntegration::Store.assets_keys.must_equal expected
    end
  end
end
