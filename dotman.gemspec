Gem::Specification.new do |spec|
  spec.name         = "dotman"
  spec.version      = "0.0.1"
  spec.executables  = "dotman"
  spec.date         = "2014-02-27"
  spec.summary      = "dotman!"
  spec.description  = "dot[files] man[ager]"
  spec.author       = "Paweł Waleczek"
  spec.email        = "pawel@thisismyasterisk.org"
  spec.files        =  %x{ git ls-files }.split("\n").select { |d| d =~ %r{^(License|Readme.md|bin/|lib/|test/)} }
  spec.homepage     = "https://github.com/pwaleczek/dotman"
  spec.license      = "WTFPL"
end
