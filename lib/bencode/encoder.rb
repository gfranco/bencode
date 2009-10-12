%w(singleton).each { |lib| require lib }

module Bencode
    
    class Encoder
        
        include Singleton
        
        def encode object
            
            if object.kind_of?(String) or object.kind_of?(Symbol)
                object = object.to_s
                return "#{object.length}:#{object}"
            end
                
            if object.kind_of? Fixnum
                return "i#{object}e"
            end
            
            if object.kind_of? Array
                list = ''
                object.each do |item|
                    list = list + encode(item)
                end
                
                return "l#{list}e"
            end
            
            if object.kind_of? Hash
                hash = ''
                object.each_pair do |key, val|
                    hash = hash + encode(key) + encode(val)
                end
                
                return "d#{hash}e"
            end
            
            raise "Unexpected object"
            
        end
        
    end
    
end