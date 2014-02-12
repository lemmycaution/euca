require 'logger'
require 'euca/core_ext/kernel'
require "euca/version"

module Euca
  
  def self.logger
    @@logger ||= Logger.new(STDOUT)
  end
  
end
