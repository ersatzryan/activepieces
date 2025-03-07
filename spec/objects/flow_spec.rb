require "spec_helper"

RSpec.describe Activepieces::Flow do
  describe "#initialize" do
    it "sets the version" do
      flow = Activepieces::Flow.new("version" => {id: 1})

      expect(flow.version).to be_a(Activepieces::Flow::Version)
    end

    it "sets the schedule" do
      flow = Activepieces::Flow.new("schedule" => {id: 1})
      expect(flow.schedule).to be_a(Activepieces::Flow::Schedule)
    end

    it "sets other attributes" do
      flow = Activepieces::Flow.new("status" => "ENABLED")
      expect(flow.status).to eq("ENABLED")
    end
  end

  describe "#displayName" do
    it "delegates to the version" do
      flow = Activepieces::Flow.new("version" => {"displayName" => "My Test Flow"})
      expect(flow.displayName).to eq("My Test Flow")
    end
  end
end
