task :setup do
  invoke :install_bundler
  invoke :create_paths
end

desc 'Deploys the current version to the server'
task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'unicorn:config'
    invoke :'create_symlinks'
    invoke :'bundle:install'

    # skip migrate if migrate=false specified
    invoke :'rails:db_migrate' unless ENV['migrate'] == 'false'

    invoke :'deploy:cleanup'

    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"

      # will either start unicorn or silently fail (if already running)
      invoke :'unicorn:start'
      # can't start a started server and can't restart a stopped server
      # so need both to cover deploy as well as REdeploy
      invoke :'unicorn:restart'

      # seemlessly restart - 12113 is the PID
      # queue "kill -s USR2 12113"
    end
  end
end

task :install_bundler do
  queue 'echo "-----> Install bundler"'
  queue echo_cmd 'gem install bundler'
end

task :create_paths do
  queue 'echo "-----> Create configs path"'
  queue echo_cmd "mkdir -p #{config_path}"
  queue echo_cmd "chmod g+rx,u+rwx #{config_path}"

  queue 'echo "-----> Create shared paths"'
  shared_dirs = shared_paths.map do |file|
    # this is a path if no extension
    # otherwise, we need to lose the filename
    path = "#{deploy_to}/#{shared_path}/#{file}"
    if File.extname(path).empty?
      path
    else
      File.dirname(path)
    end
  end.uniq

  shared_dirs.map do |dir|
    queue echo_cmd "mkdir -p #{dir}"
    queue echo_cmd "chmod g+rx,u+rwx #{dir}"
  end

  queue 'echo "-----> Create PID path"'
  queue echo_cmd "mkdir -p #{pids_path} && chown #{user}:#{group} #{pids_path} && chmod +rw #{pids_path}"
end

namespace :unicorn do
  desc 'Create and upload unicorn config file'
  task :config do
    upload_template
  end
end

def upload_template
  contents = parse_template
  queue %(echo "-----> Put unicorn file at #{unicorn_deploy_config}")
  queue %(echo "#{contents}" > #{unicorn_deploy_config})
end

def parse_template
  erb("#{unicorn_deploy_template}").gsub('"', '\\"').gsub('`', '\\\\`').gsub('$', '\\\\$')
end

task :create_symlinks do
  queue 'echo "-----> Create symlinks"'
  symlink_paths.each do |symlink_path|
    queue echo_cmd "ln -s #{symlink_path[0]} #{symlink_path[1]}"
  end
end
