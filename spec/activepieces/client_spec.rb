require "spec_helper"

RSpec.describe Activepieces::Client do
  describe ".new" do
    describe "host" do
      after do
        Activepieces.configuration = nil
      end

      it "defaults to configuration setting" do
        Activepieces.configure do |config|
          config.host = "my.host.com"
        end

        client = Activepieces::Client.new

        expect(client.host).to eq("my.host.com")
      end

      it "can be set at initialization" do
        client = Activepieces::Client.new(host: "my.host.com")

        expect(client.host).to eq("my.host.com")
      end
    end

    describe "api_key" do
      after do
        Activepieces.configuration = nil
      end

      it "defaults to configuration setting" do
        Activepieces.configure do |config|
          config.api_key = "secret"
        end

        client = Activepieces::Client.new

        expect(client.api_key).to eq("secret")
      end

      it "can be set at initialization" do
        client = Activepieces::Client.new(api_key: "other")

        expect(client.api_key).to eq("other")
      end
    end
  end
end
