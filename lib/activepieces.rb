# frozen_string_literal: true

require "faraday"
require "activepieces/version"

module Activepieces
  class Error < StandardError; end

  autoload :Configuration, 'activepieces/configuration'
  autoload :Client, 'activepieces/client'

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
