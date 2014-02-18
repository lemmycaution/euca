require 'euca'
require 'euca/wrapper'

module Euca
  module Model
    
    module ClassMethods
      
      COLUMNS = "@@columns"
      TYPE_ID = "@@type_id"
      WRAPPER = "@@wrapper"
      
      def columns names = nil
        unless names.nil?
          class_variable_set(COLUMNS,names)
        end
        class_variable_get(COLUMNS)
      end
      
      def type_id
        class_variable_get(TYPE_ID) || class_variable_set(TYPE_ID, self.name)
      end
      
      def type_id=type_id
        class_variable_set(TYPE_ID,type_id)
      end
      
      def wrapper
        begin
          class_variable_get(WRAPPER)
        rescue NameError
          Wrapper.new(self.type_id, self.columns)
        end
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
      @wrapper ||= self.class.wrapper
    end
    
  end
end
