module Activepieces
  class FlowsResource < Resource
    def list(**params)
      response = get("flows", params)
      Collection.from_response(response, type: Flow)
    end
  end
end
