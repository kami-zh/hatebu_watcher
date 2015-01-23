lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'hatebu_watcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'hatebu_watcher'
  spec.version       = HatebuWatcher::VERSION
  spec.authors       = ['kami']
  spec.email         = ['kami30k@gmail.com']
  spec.summary       = %q{Watch Hatena Bookmark count on console.}
  spec.description   = %q{Watch Hatena Bookmark count on console.}
  spec.homepage      = 'https://github.com/kami30k/hatebu_watcher'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'ruby-growl'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
