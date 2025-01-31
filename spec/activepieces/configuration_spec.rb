require "spec_helper"

RSpec.describe Activepieces::Configuration do
  describe "#host" do
    it "defaults to cloud host" do
      client = Activepieces::Configuration.new

      expect(client.host).to eq("cloud.activepieces.com")
    end
  end
end
