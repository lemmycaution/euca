module Euca
  class Instance
      
    include Euca::Model
    include Euca::Filterable
      
    TYPE_ID = "instance"
    TYPE_ATTRS = %w(type_id id image public_dns_name private_dns_name status group 
    ami_launch_index product_code instance_type launched_at zone kernel_id 
    ramdisk_id platform monitoring public_ip private_ip vpc_id subnet_id 
    root_type lifecycle spot_id license placement_group virtualization hypervisor
    client_token security_group_id tenancy ebs_optimized)

    def self.create *args
      euca("run-instances",*args).first
    end
    
    def self.destroy id
      euca("terminate-instances",id).first
    end

  end
end
    
