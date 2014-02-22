require 'support/minitest_helper'

module Euca
  describe Keypair do
  
    it "generates ssh key for given email" do
      wrapper = Keypair.wrapper
      fixture = Keypair.wrapper.parse(fixture(:keypairs)["test"]) 
    
      mock = MiniTest::Mock.new
      mock.expect :run, fixture, [ "create-keypair", "test@best.com", ">", "~/.ssh/test@best.com.id" ]
      mock.expect :run, fixture, [ "describe-keypairs", "test@best.com" ]      
            
      Keypair.instance_variable_set "@wrapper",mock      

      keypair = Keypair.create "test@best.com"
      
      keypair["id"].must_equal "test@best.com"
      
      Keypair.find(keypair["id"])["fingerprint"].wont_be_nil
    
    end
  end
end