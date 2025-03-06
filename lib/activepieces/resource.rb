module Activepieces
  class Resource
    attr_reader :client
    def initialize(client)
      @client = client
    end

    private

    def get(path, params = {})
      handle_response(client.connection.get(path, params))
    end

    def post(path, params = {})
      handle_response(client.connection.post(path, params))
    end

    def put(path, params = {})
      handle_response(client.connection.put(path, params))
    end

    def delete(path, params = {})
      handle_response(client.connection.delete(path, params))
    end

    def handle_response(response)
      response
    end
  end
end
