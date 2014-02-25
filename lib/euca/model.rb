require 'euca/wrapper'
require 'active_support/inflector'
module Euca
  module Model
    
    module ClassMethods
      
      def wrapper
        @wrapper ||= Wrapper.new(self::TYPE_ID, self::TYPE_ATTRS)
      end
      
      def all
        describe
      end

      def where query = {}
        all.select{ |m| 
          s = m.select{ |k,v| query.keys.include?(k.to_sym) }
          s.values.sort == query.values.sort 
        }
      end
      
      def find_by query = {}
        where(query).first
      end
      
      def find id
        describe(id).first
      end 
      
      def describe *args
        euca("describe-#{self.describer}",*args)
      end                 
      
      def describer; @describer ||= self::TYPE_ID.tableize; end
      
      def euca api, *args
        self.wrapper.run api, *args
      end
      
    end
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    def persisted?
      self.class.find(self.id)
    end
    
    def euca api, *args
      wrapper.run api, *args
    end
    
    private
    
    def wrapper
      @wrapper ||= self.class.wrapper
    end
    
  end
end
