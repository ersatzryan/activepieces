module Activepieces
  class FlowsResource < Resource
    def list(**params)
      raise ArgumentError, "missing required parameter :project_id" unless params[:project_id]

      response = get("flows", params)
      Collection.from_response(response, type: Flow)
    end

    def find(id)
      response = get("flows/#{id}")
      Flow.new(**response.body)
    end
  end
end
