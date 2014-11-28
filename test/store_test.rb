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
end