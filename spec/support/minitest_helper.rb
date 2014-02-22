require "minitest/pride"
require "minitest/autorun"
require 'euca'
require 'yaml'
require 'pult'

Pult.log_level = 0

class MiniTest::Spec
  
  def fixture name
    YAML.load_file("spec/fixtures/#{name}.yml")
  end
  
end