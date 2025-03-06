module Activepieces
  class Client
    BASE_PATH = "/api/v1"
    attr_reader :api_key, :host, :adapter

    def initialize(api_key: nil, host: nil, stubs: nil)
      @api_key = api_key || Activepieces.configuration.api_key
      @host = host || Activepieces.configuration.host

      @adapter = stubs ? :test : Faraday.default_adapter
      @stubs = stubs
    end

    def flow_runs
      FlowRunsResource.new(self)
    end

    def connection
      @connection ||= build_connection
    end

    private

    def build_connection
      Faraday.new(base_url) do |conn|
        conn.request :authorization, :Bearer, api_key
        conn.request :json

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end

    def base_url
      URI::HTTPS.build(host: host, path: BASE_PATH).to_s
    end
  end
end
