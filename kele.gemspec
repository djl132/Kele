Gem::Specification.new do |s|
  s.name          = 'kele'
    s.version       = '0.0.1'
  s.date          = '2017-03-28'
  s.summary       = 'Kele API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Derek Lin']
  s.email         = 'djl32@case.edu'
  s.files         = ['lib/kele.rb', 'lib/roadmap.rb']
  s.require_paths = ["lib"]
  s.homepage      = 'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  #  provides a programmatic Ruby interface to make HTTP requests.
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_runtime_dependency 'json', '~> 2.0', '>= 2.0.3'
end
