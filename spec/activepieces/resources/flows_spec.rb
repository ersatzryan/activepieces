require "spec_helper"

RSpec.describe Activepieces::FlowsResource do
  describe "#list" do
    it "returns a list of flows" do
      stub = stub_request("flows", response: stub_response(fixture: "flows/list"))
      client = Activepieces::Client.new(stubs: stub)
      flows = client.flows.list(project_id: 1)

      expect(flows).to be_a(Activepieces::Collection)
      expect(flows.count).to eq(1)

      item = flows.items.first
      expect(item).to be_a(Activepieces::Flow)
      expect(item.displayName).to eq("My Awesome Flow")
    end
  end

  describe "#find" do
    it "returns a flow" do
      stub = stub_request("flows/1", response: stub_response(fixture: "flows/get"))
      client = Activepieces::Client.new(stubs: stub)
      flow = client.flows.find(1)

      expect(flow).to be_a(Activepieces::Flow)
      expect(flow.displayName).to eq("My Other Awesome Flow")
    end
  end
end
