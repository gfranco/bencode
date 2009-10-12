%w(singleton strscan).each { |lib| require lib }

module Bencode
    
    class Decoder
        
        include Singleton
        
        def decode input
            @input = StringScanner.new input
            parse
        ensure
            @input.eos? or error 'Unexpected data'
        end
        
        private
        
        attr_accessor :input
        
        def parse
            parse_string or parse_number or parse_list or parse_hash or error 'Illegal Bencode value'
        end
        
        def parse_string
            if @input.scan /\d+:/
                value = @input.post_match[0, @input.matched.to_i]
                @input.pos = @input.pos + @input.matched.to_i
                value
            else
                false
            end
        end
        
        def parse_number
            if @input.scan /i(0|-?[1-9]\d*)e/
                @input.matched.gsub(/^i|e$/, '').to_i
            else
                false
            end
        end
        
        def parse_list
            if @input.scan /l/
                value = []
                until @input.scan /e/
                    value << parse
                end
                
                value
            else
                false
            end
        end
        
        def parse_hash
            if @input.scan /d/
                value = {}
                until @input.scan /e/
                    value[parse_string] = parse
                end
                
                value
            else
                false
            end
        end
        
        def error message
            raise message
        end
        
    end
    
end