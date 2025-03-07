require "ostruct"

module Activepieces
  class Flow < OpenStruct
    extend Forwardable
    attr_reader :version, :schedule

    def_delegators :version, :displayName

    def initialize(**attributes)
      @version = Version.new(attributes.delete("version"))
      @schedule = Schedule.new(attributes.delete("schedule"))

      super(attributes)
    end

    class Version < OpenStruct; end

    class Schedule < OpenStruct; end
  end
end
