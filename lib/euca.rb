require 'rye'
require "euca/api"

module Euca
  
  EUCA_VERSION  = "euca-version".freeze
  UBUNTU_13_10 = "qmi-c4c45230"
  UBUNTU_12_04 = "qmi-b58041dd"
  T1_NANO      = "t1.nano"
  
  def self.has_cli?
    self.version.exit_status == 0
  end
  
  def self.version
    sh(BIN_VERSION)
  end
  
  def self.api_methods
    @@api_methods ||= begin
      sh(:ls, :"1", "#{self.exec_path}/euca-*").
      gsub(/#{self.exec_path}\/euca-/m,"").split("\n")
    end
  end
  
  def self.exec_path
    @@euca_home ||= sh(:dirname, "$(which euca-version)")
  end
  
  def self.sh *args
    ret = Rye.shell *args
    raise RuntimeError.new(ret.stderr.join($/)) if ret.exit_status != 0
    ret.to_s
  end

end
