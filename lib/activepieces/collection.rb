module Activepieces
  class Collection
    include Enumerable
    attr_reader :items, :client

    def initialize(items)
      @items = items
    end

    def self.from_response(response, type:)
      new(response.body["data"].map { |attrs| type.new(**attrs) })
    end

    def each(&block)
      items.each(&block)
    end
  end
end
