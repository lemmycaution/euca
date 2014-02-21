require 'pult'
require 'vhs'
require "euca/version"
require "euca/model"

module Euca
  BIN_NAME="euca2ools".freeze
  BIN_VERSION="euca-version".freeze
  
  def self.has_cli?
    !(self.version =~ /\d+\.\d+\.\d+/).nil?
  end
  
  def self.version
    sh(BIN_VERSION).gsub(/#{BIN_NAME} /,"")
  end
  
  def self.api_methods
    @@api_methods ||= sh("ls -1 #{self.exec_path}/euca-*").gsub(/#{self.exec_path}\/euca-/m,"").split("\n")
  end
  
  def self.exec_path
    @@euca_home ||= sh("dirname $(which euca-version)")
  end
end
