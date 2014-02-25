module Euca
  module Filterable
    
    module ClassMethods
      
      def where args
        args = args.map{|key,value| "--filter #{key}=#{value}" }
        describe *args
      end
  
      def find_by args
        where(args).first
      end  
    end
    
    def self.included(base)
      base.extend ClassMethods
    end
    
  end
end