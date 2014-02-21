require 'euca'
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
      def where *args
        describe "--filter", *args
      end
      def find_by *args
        where(*args).first
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
