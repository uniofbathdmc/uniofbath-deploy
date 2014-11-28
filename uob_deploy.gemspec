Gem::Specification.new do |spec|
  spec.name        = 'uob_deploy'
  spec.version     = '0.0.2'
  spec.executables << 'uob_deploy'
  spec.date        = '2014-11-28'
  spec.summary     = "Manage build scripts for a Ruby application"
  spec.description = "Manage build scripts for a Ruby application"
  spec.authors     = ["Tom Natt"]
  spec.email       = 't.w.natt@bath.ac.uk'
  spec.require_paths = ["lib"]
  spec.homepage    = 'http://www.bath.ac.uk'
  spec.license     = 'MIT'

  # we need mina to use these scripts
  spec.add_development_dependency 'mina', '0.3.1'
  spec.add_development_dependency 'mina-unicorn', '0.0.3'
end