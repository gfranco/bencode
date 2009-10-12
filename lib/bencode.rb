# 
#  bencode
#  Simple library for encoding and decoding bencoded data
#  
#  Created by gfranco on 2009-10-03.
#  Copyright 2009 ololo. All rights reserved.
# 

$:.unshift File.dirname(__FILE__) unless $:.include? File.dirname(__FILE__)

module Bencode
    
    def Bencode.decode string
        Decoder.instance.decode string
    end
    
    def Bencode.decode_file filepath
        Decoder.instance.decode File.open(filepath).read
    end
    
    def Bencode.encode object
        Encoder.instance.encode object
    end
    
end

require 'bencode/decoder'
require 'bencode/encoder'