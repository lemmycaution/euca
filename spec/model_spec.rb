require 'support/minitest_helper'
require 'euca/model'

describe Euca::Model do
  it "implements wrapper" do
    Api = Class.new
    Api.send :include, Euca::Model
    Api.columns %w(type id name)
    Api.type_id = "image"   
    api = Api.new
    
    wrapper = MiniTest::Mock.new
    wrapper.expect :run, api.send(:wrapper).parse(fixture(:images)["all"]), [ "describe-images" ]
    
    api.instance_variable_set "@wrapper", wrapper
        
    images = api.euca("describe-images")
    images.first["name"].must_equal "Ubuntu Server 12.04.1"
  end
end