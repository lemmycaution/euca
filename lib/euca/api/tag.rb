module Euca
  class Tag
      
    include Euca::Model
    include Euca::Filterable
          
    TYPE_ID = "tag"
    TYPE_ATTRS = %w(type instance_id key value)
      
    def self.create key, value, instance_id = nil
      if key.is_a? Hash
        euca("create-tags", key.map{|key,value| "--tag #{key}=#{value}" }.join(" ") , value).first
      else
        return nil if instance_id.nil?
        euca("create-tags", "--tag #{key}=#{value}", instance_id).first
      end
    end
      
    def self.destroy key, value, instance_id = nil
      if key.is_a? Hash
        euca("delete-tags", key.map{|key,value| "--tag #{key}=#{value}" }.join(" ") , value).first
      else
        return nil if instance_id.nil?
        euca("delete-tags", "--tag #{key}=#{value}", instance_id).first 
      end
    end  
    
  end
end
