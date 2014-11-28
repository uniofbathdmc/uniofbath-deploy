namespace :env do
  task :digilin01 do
    set :branch,       'mina-rewrite'          # branch to deploy
    set :rails_env,    'staging'               # rails environment to use
    set :domain,       'digilin-01.bath.ac.uk' # machine
    set :user,         'ma1twn-test'           # user to deploy as
    set :deploy_to,    '/home/ma1twn-test'     # home directory of user
    set :app_port,     3055                    # port to run on

    set :shared_paths, ['tmp', 'log', 'config/unicorn.rb', 'output']

    # this needs to be here in every environment
    invoke :defaults
  end
end