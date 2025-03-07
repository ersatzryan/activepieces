module Activepieces
  class FlowRunsResource < Resource
    def list(**params)
      response = get("flow-runs", params)
      Collection.from_response(response, type: FlowRun)
    end
  end
end
