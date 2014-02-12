require 'support/minitest_helper'
require 'euca/wrapper'

describe Euca::Wrapper do
  it "runs euca commands and parses results into hash" do
    wrapper = Euca::Wrapper.new("image",%w(type id name))
    
    # images = wrapper.run "describe-images"
    images = wrapper.parse fixture(:images)["all"]
    images.first["name"].must_equal "Ubuntu Server 12.04.1"
  end
end