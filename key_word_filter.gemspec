$:.push File.dirname(__FILE__) + '/lib'
require 'key-word-filter-on/version'

Gem::Specification.new do |gem|
  gem.name = %q{key-word-filter-on}
  gem.authors = ["Lijia.Tong"]
  gem.date = %q{2012-08-05}
  gem.description = %q{Filter sensitive keyword method.}
  gem.summary = "Filtering illegal characters and sensitive words."
  gem.email = %q{wtuyuupe@163.com}
  gem.homepage      = 'http://hi.baidu.com/new/user_tony'

  gem.add_runtime_dependency 'rails', '~> 3.0'
  gem.add_development_dependency 'rspec', '~> 2.6'

   gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
   gem.files         = `git ls-files`.split("\n")
   # gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "key-word-filter-on"
  gem.require_paths = ['lib']
  gem.version       = KeyWordFilterOn::VERSION
end
