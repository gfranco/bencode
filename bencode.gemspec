spec = Gem::Specification.new do |gem|
    
    gem.name            = 'bencode'
    gem.version         = '0.34'
    gem.summary         = 'Simple library for encoding and decoding bencode'
    gem.files           = ['README', 'lib/bencode.rb', 'lib/bencode/encoder.rb', 'lib/bencode/decoder.rb']
    gem.require_path    = 'lib'
    
    gem.has_rdoc        = true
    gem.rdoc_options    = ['--inline-source', '--charset=UTF-8']
    
    gem.author          = 'gfranco'
    gem.email           = 'hello@gfranco.ru'
    gem.homepage        = 'http://github.com/gfranco/bencode'
    
end