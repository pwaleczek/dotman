Gem::Specification.new do |gem|
  gem.name         = "dotman"
  gem.version      = "0.0.1"
  gem.executables  = "dotman"
  gem.date         = "2014-02-27"
  gem.summary      = "dotman!"
  gem.description  = "dot[files] man[ager]"
  gem.author       = "Paweł Waleczek"
  gem.email        = "pawel@thisismyasterisk.org"
  gem.files        =  %x{ git ls-files }.split("\n").select { |d| d =~ %r{^(License|Readme.md|bin/|lib/|test/)} }
  gem.homepage     = "https://github.com/pwaleczek/dotman"
  gem.license      = "WTFPL"
end
