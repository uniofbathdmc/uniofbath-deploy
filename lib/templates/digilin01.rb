namespace :env do
  task :digilin01 do
    set :branch,       'staging'                 # branch to deploy
    set :rails_env,    'development'             # rails environment to use
    set :domain,       'digilin-01.bath.ac.uk'   # machine
    set :user,         'application-user'        # user to deploy as
    set :deploy_to,    '/home/application-user'  # home directory of user
    set :app_port,     3055                      # port to run on

    # uncomment and add to this if you wish to change defaults
    # set :shared_paths, ['tmp', 'log', 'config/unicorn.rb']

    # this needs to be here in every environment
    invoke :defaults
  end
end
