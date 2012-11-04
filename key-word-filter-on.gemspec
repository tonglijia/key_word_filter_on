# -*- encoding: utf-8 -*-
require File.expand_path('../lib/key-word-filter-on/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["lijia.tong"]
  gem.email         = ["wtuyuupe@163.com"]
  gem.description   = %q{Filter sensitive keyword method.}
  gem.summary       = %q{Filtering illegal characters and sensitive words.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "key-word-filter-on"
  gem.require_paths = ["lib"]
  gem.version       = KeyWordFilterOn::VERSION
end
