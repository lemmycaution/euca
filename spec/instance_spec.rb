require 'support/minitest_helper'
require 'euca/api/instance'

module Euca
  describe Instance do
  
    it "finds unassociated ip unless foce given on create" do
      wrapper = Instance.wrapper
      fixture = Instance.wrapper.parse(fixture(:instance)["valid"]) 
    
      mock = MiniTest::Mock.new
      mock.expect :run, fixture, [ "run-instances", "-t", Euca::T1_NANO, Euca::UBUNTU_13_10 ]
            
      Instance.instance_variable_set "@wrapper",mock      

      instance = Instance.create "-t", Euca::T1_NANO, Euca::UBUNTU_13_10
      
      instance["public_dns_name"].must_equal "i-46-149-29-252.compute.is-1.greenqloud.com"

      mock.expect :run, fixture, [ "describe-instances", "--filter instance-id=i-6e13180f" ]      
      finded = Instance.find_by({"instance-id" => instance["id"]})
      finded["public_dns_name"].must_equal instance["public_dns_name"]
    end
  end
end