require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/unicorn'

require 'uob_deploy'

# load the environment config files
Dir['./config/deployment/*.rb'].each { |f| load f }

set :repository,   'git@github.bath.ac.uk:digital/cms-alpha-publisher.git'
set :default_server, :digilin01

set :server, ENV['to'] || default_server
invoke :"env:#{server}"
