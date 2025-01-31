module Activepieces
  class Client
    attr_reader :api_key, :host

    def initialize(api_key: nil, host: nil)
      @api_key = api_key || Activepieces.configuration.api_key
      @host = host || Activepieces.configuration.host
    end
  end
end
