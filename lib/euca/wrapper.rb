module Euca
  class Wrapper
    
    def initialize type_id, columns = nil
      @type_id = type_id
      @columns = columns
    end
    
    def run api, *args
      raise NoMethodError.new("Euca#run: #{api} not found") and return false unless Euca.api_methods.include?(api)
      parse Euca.sh(:"euca-#{api}", *args).to_s
    end
    
    def parse response
      response.split("\n").
      keep_if{ |line| line.match(/^#{@type_id}/i) }.
      map{ |line| 
        rows = line.gsub("\n","").split("\t")
        @columns.nil? ? rows : Hash[  @columns.zip( rows ) ]
      }
    end

  end
end
