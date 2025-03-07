module Activepieces
  class FlowRunsResource < Resource
    def list(**params)
      raise ArgumentError, "missing required parameter :project_id" unless params[:project_id]

      response = get("flow-runs", params)
      Collection.from_response(response, type: FlowRun)
    end

    def find(id)
      response = get("flow-runs/#{id}")
      FlowRun.new(**response.body)
    end
  end
end
