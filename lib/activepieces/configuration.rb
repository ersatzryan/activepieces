module Activepieces
  class Configuration
    DEFAULTS = {
      host: "cloud.activepieces.com"
    }.freeze

    attr_accessor :api_key
    attr_writer :host

    def host
      @host ||= DEFAULTS[:host]
    end
  end
end
