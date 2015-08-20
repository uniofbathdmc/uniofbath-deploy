Gem::Specification.new do |spec|
  spec.name        = 'uniofbath_deploy'
  spec.version     = '0.0.8'
  spec.executables << 'uniofbath_deploy'
  spec.date        = '2014-11-28'
  spec.summary     = 'Manage build scripts for a Ruby application'
  spec.description = 'Create and maintain the mina deployment scripts'
  spec.authors     = ['Tom Natt']
  spec.email       = 't.w.natt@bath.ac.uk'
  spec.require_paths = ['lib']
  spec.homepage    = 'http://www.bath.ac.uk'
  spec.license     = 'MIT'

  # we need mina to use these scripts
  spec.add_dependency 'mina', '0.3.1'
  spec.add_dependency 'mina-unicorn', '0.0.3'
  spec.add_dependency 'redis', '3.2.1'
end
