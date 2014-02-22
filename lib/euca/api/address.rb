module Euca
  class Address
      
    include Euca::Model
      
    TYPE_ID = "address"
    TYPE_ATTRS = %w(type_id ip instance_id)

    def self.create force = false
      !force ? find_by(instance_id: "None") || allocate : allocate
    end
      
    def self.destroy ip
      euca("release-address", ip)
    end
    
    def self.associate instance_id, ip
      euca("associate-address", "-i", instance_id, ip)
    end
    
    private
    
    def self.allocate
      euca("allocate-address").first
    end
      
  end
end
    
