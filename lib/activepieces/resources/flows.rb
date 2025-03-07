module Activepieces
  class FlowsResource < Resource
    def list(**params)
      response = get("flows", params)
      Collection.from_response(response, type: Flow)
    end

    def find(id)
      response = get("flows/#{id}")
      Flow.new(**response.body)
    end
  end
end
