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
      expected = ["brand_view-bundle.js", "brand_view_styles-bundle.js", "common.js", "executive_view-bundle.js", "executive_view_styles-bundle.js", "img/logo.png", "img/logo_for_runaways.png"]
      WebpackIntegration::Store.assets_keys.must_equal expected
    end
  end


  describe 'assets_manifest' do
    it "is a hash-map, that maps clean names to digested names with full path" do
      expected = {"brand_view-bundle.js"=>"/webpack/brand_view-bundle-3e23e81.js", "brand_view_styles-bundle.js"=>"/webpack/brand_view_styles-bundle-ca97811.js", "common.js"=>"/webpack/common-2e7d2c0.js", "executive_view-bundle.js"=>"/webpack/executive_view-bundle-3f79bb7.js", "executive_view_styles-bundle.js"=>"/webpack/executive_view_styles-bundle-18ac3e7.js", "img/logo.png"=>"/webpack/img/logo-0ebe2ec.png", "img/logo_for_runaways.png"=>"/webpack/img/logo_for_runaways-907b853.png"}
      WebpackIntegration::Store.assets_manifest.must_equal(expected)
    end
  end

  describe 'file_for' do
    it "returns the exact match on keys" do
      expected = '/webpack/brand_view-bundle-3e23e81.js'
      WebpackIntegration::Store.file_for('brand_view-bundle.js').must_equal expected
    end

    it "blows up otherwise" do
      exception = lambda{
        WebpackIntegration::Store.file_for('non-existant')
      }.must_raise KeyError
      exception.message.must_equal "key not found: \"non-existant\""
    end
  end

  describe 'fuzzy_file_for' do
    it "will return the only matching file" do
      expected = '/webpack/brand_view-bundle-3e23e81.js'
      WebpackIntegration::Store.fuzzy_file_for('brand_view-bundle').must_equal expected
    end

    it "blows up on ambiguous matches" do
      exception = lambda{
        WebpackIntegration::Store.fuzzy_file_for('brand_view')
      }.must_raise RuntimeError
      exception.message.must_equal "TOO MANY MATCHES for brand_view"
    end
  end

  describe 'reset' do
    it "sets the mainifest to nil" do
      WebpackIntegration::Store.reset
      WebpackIntegration::Store.instance_variable_get('@assets_manifest').must_equal nil
      WebpackIntegration::Store.assets_manifest.wont_equal nil
    end
  end
end
