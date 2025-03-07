module Activepieces
  class FlowRunsResource < Resource
    def list(**params)
      response = get("flow-runs", params)
      Collection.from_response(response, type: FlowRun)
    end

    def find(id)
      response = get("flow-runs/#{id}")
      FlowRun.new(**response.body)
    end
  end
end
