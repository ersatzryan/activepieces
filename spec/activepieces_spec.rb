# frozen_string_literal: true

RSpec.describe Activepieces do
  it "has a version number" do
    expect(Activepieces::VERSION).not_to be nil
  end

  describe ".configure" do
    after do
      Activepieces.configuration = nil
    end

    it "allows setting of api_key" do
      Activepieces.configure do |config|
        config.api_key = "some_secret"
      end

      expect(Activepieces.configuration.api_key).to eq("some_secret")
    end

    it "allows setting of host" do
      Activepieces.configure do |config|
        config.host = "my.host.com"
      end

      expect(Activepieces.configuration.host).to eq("my.host.com")
    end
  end
end
