require "spec_helper"

RSpec.describe Activepieces::FlowRunsResource do
  describe "#list" do
    it "returns a list of flow runs" do
      stub = stub_request("flow-runs", response: stub_response(fixture: "flow_runs/list"))
      client = Activepieces::Client.new(stubs: stub)
      flow_runs = client.flow_runs.list(project_id: 1)

      expect(flow_runs).to be_a(Activepieces::Collection)
      expect(flow_runs.count).to eq(1)

      item = flow_runs.items.first
      expect(item).to be_a(Activepieces::FlowRun)
      expect(item.flowDisplayName).to eq("My Test Flow")
    end

    it "requires a project_id" do
      client = Activepieces::Client.new

      expect { client.flow_runs.list }.to raise_error(ArgumentError, "missing required parameter :project_id")
    end
  end

  describe "#find" do
    it "returns a flow run" do
      stub = stub_request("flow-runs/1", response: stub_response(fixture: "flow_runs/get"))
      client = Activepieces::Client.new(stubs: stub)
      flow_run = client.flow_runs.find(1)
      expect(flow_run).to be_a(Activepieces::FlowRun)
      expect(flow_run.flowDisplayName).to eq("My Test Flow")
    end
  end
end
