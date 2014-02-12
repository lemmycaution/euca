require 'euca'
require 'euca/wrapper'

module Euca
  module Model
    
    module ClassMethods
      
      def columns names = nil
        unless names.nil?
          @@columns = names
        end
        @@columns
      end
      
      def type_id
        @@type_id ||= self.name
      end
      
      def type_id=type_id
        @@type_id = type_id
      end
      
    end
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    def euca api, *args
      wrapper.run api, *args
    end
    
    private
    
    def wrapper
      @wrapper ||= Wrapper.new self.class.type_id, self.class.columns
    end
    
  end
end
