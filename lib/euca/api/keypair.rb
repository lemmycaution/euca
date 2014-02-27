module Euca
  class Keypair
      
    include Euca::Model
      
    TYPE_ID = "keypair"
    TYPE_ATTRS = %w(type id fingerprint)
      
    def self.create email, path = "~/.ssh"      
      keyfile = "#{path}/#{email}.id"
      keypairs = euca("create-keypair", email, ">", keyfile)
      Euca.sh :chmod, 600, keyfile
      {"id" => email}
    end
      
    def self.destroy id 
      euca("delete-keypair", id).first 
    end
      
  end
end
