require 'support/minitest_helper'
require 'euca/model'

describe Euca::Model do
  
  before do
    
    class Api
      include Euca::Model
      TYPE_ATTRS= %w(type id name)
      TYPE_ID = "image"   
    end

  end
  
  it "implements wrapper" do
    
    api = Api.new
    
    wrapper = MiniTest::Mock.new
    wrapper.expect :run, api.send(:wrapper).parse(fixture(:images)["all"]), [ "describe-images" ]
    
    Api.instance_variable_set "@wrapper", wrapper
        
    images = api.euca("describe-images")
    images.first["name"].must_equal "Ubuntu Server 12.04.1"
  end
end