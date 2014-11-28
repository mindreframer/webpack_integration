require './test/test_helper'


class PublicApiTest  < Minitest::Spec
  before do
    WebpackIntegration.configure do |config|
      config.public_folder    = 'test/fixtures'
      config.folder_in_public = 'webpack'
    end
  end

  describe 'file_for' do
    it "delegates to store" do
      WebpackIntegration::Store.expects(:file_for).with('test')
      WebpackIntegration.file_for('test')
      WebpackIntegration::Store.unstub(:file_for)
    end
  end


  describe 'fuzzy_file_for' do
    it "delegates to store" do
      WebpackIntegration::Store.expects(:fuzzy_file_for).with('test')
      WebpackIntegration.fuzzy_file_for('test')
      WebpackIntegration::Store.unstub(:fuzzy_file_for)
    end
  end

  describe 'reset_assets_manifest!' do
    it "delegates to store" do
      WebpackIntegration::Store.expects(:reset)
      WebpackIntegration.reset_assets_manifest!
      WebpackIntegration::Store.unstub(:reset)
    end
  end
end
