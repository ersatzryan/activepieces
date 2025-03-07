require "spec_helper"

RSpec.describe Activepieces::FlowRunsResource do
  describe "#list" do
    it "returns a list of flow runs" do
      stub = stub_request("flow-runs", response: stub_response(fixture: "flow_runs/list"))
      client = Activepieces::Client.new(stubs: stub)
      flow_runs = client.flow_runs.list

      expect(flow_runs).to be_a(Activepieces::Collection)
      expect(flow_runs.count).to eq(1)

      item = flow_runs.items.first
      expect(item).to be_a(Activepieces::FlowRun)
      expect(item.flowDisplayName).to eq("My Test Flow")
    end
  end
end
