require 'support/minitest_helper'
require 'euca/api/address'

module Euca
  describe Address do
  
    it "finds unassociated ip unless foce given on create" do
      wrapper = Address.wrapper
      fixture = Address.wrapper.parse(fixture(:address)["free"]) 
    
      mock = MiniTest::Mock.new
      mock.expect :run, fixture, [ "describe-addresses" ]
      mock.expect :run, fixture, [ "allocate-address" ]
      
            
      Address.instance_variable_set "@wrapper",mock      

      address = Address.create
      
      address["ip"].must_equal "46.149.28.166"
            
      address = Address.create(true)
      address["ip"].must_equal "46.149.28.166"
    end
  end
end