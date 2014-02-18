require 'euca/core_ext/kernel'
require "euca/version"
require 'logger'

module Euca
  def self.logger
    @@logger ||= $logger || Logger.new(STDOUT)
  end
end
