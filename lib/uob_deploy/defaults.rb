## Default settings
task :defaults do
  # system settings
  set_default :group, 'dmc-system'

  # unicorn settings
  set_default :unicorn_env, rails_env
  set_default :unicorn_role, user
  set_default :unicorn_timeout, 20
  set_default :unicorn_worker_processes, 5

  # application paths
  set_default :pids_path, File.join(deploy_to, '/shared/tmp/pids')
  set_default :shared_paths, ['tmp', 'log', 'config/unicorn.rb']
  set_default :config_path, File.join(deploy_to, shared_path, 'config')
  set_default :unicorn_deploy_template, 'config/mina/unicorn.rb.erb'
  set_default :unicorn_deploy_config, File.join(config_path, 'unicorn.rb')
end