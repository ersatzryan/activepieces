# frozen_string_literal: true

require "faraday"
require "activepieces/version"

module Activepieces
  class Error < StandardError; end

  autoload :Client, "activepieces/client"
  autoload :Collection, "activepieces/collection"
  autoload :Configuration, "activepieces/configuration"
  autoload :Resource, "activepieces/resource"

  autoload :FlowRunsResource, "activepieces/resources/flow_runs"
  autoload :FlowRun, "activepieces/objects/flow_run"

  def self.configuration=(config)
    @configuration = config
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure(&block)
    yield(configuration)
  end
end
