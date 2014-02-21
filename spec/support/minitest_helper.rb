require "minitest/pride"
require "minitest/autorun"
require 'euca'
require 'yaml'

class MiniTest::Spec
  
  def fixture name
    YAML.load_file("spec/fixtures/#{name}.yml")
  end
  
end