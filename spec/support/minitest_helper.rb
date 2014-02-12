require "minitest/pride"
require "minitest/autorun"
require 'euca'
require 'yaml'

ENV["KEYPAIR"]="~/.ssh/gq_credentials/default_ssh.id"

class MiniTest::Spec
  
  def fixture name
    YAML.load_file("spec/fixtures/#{name}.yml")
  end
  
end