require 'fileutils'

class UobDeploy

  # application locations
  @config_dir = 'config'
  @deploy_dir = File.join(@config_dir, 'deployments')

  # templates
  @templates_dir = File.join(File.dirname(__FILE__), '../templates/')
  @unicorn_deploy_template_name = 'deploy.rb'
  @environment_deploy_template_name = 'digilin01.rb'
  @new_environment_deploy_template_name = 'new.rb'

  # to copy
  @unicorn_template = File.join(@templates_dir, @unicorn_deploy_template_name)
  @environment_template = File.join(@templates_dir, @environment_deploy_template_name)

  # output
  @unicorn_deploy = File.join(@config_dir, @unicorn_deploy_template_name)
  @environment_deploy = File.join(@deploy_dir, @environment_deploy_template_name)
  @new_environment_deploy = File.join(@deploy_dir, @new_environment_deploy_template_name)

  # create the deploy.rb file and deployments directory
  def self.init
    # mkdir -p config/deployments
    FileUtils.mkdir_p(@deploy_dir)

    puts "Creating #{@unicorn_deploy}"
    unless File.exists?(@unicorn_deploy)
      FileUtils.cp(@unicorn_template, @unicorn_deploy)
    end

    puts "Creating #{@environment_deploy}"
    unless File.exists?(@environment_deploy)
      FileUtils.cp(@environment_template, @environment_deploy)
    end

    puts "Done"
  end

  # create a new environment file
  def self.new
    # mkdir -p config/deployments
    FileUtils.mkdir_p(@deploy_dir)

    puts "Creating #{@new_environment_deploy}"
    unless File.exists?(@new_environment_deploy)
      FileUtils.cp(@environment_template, @new_environment_deploy)
    end

    puts "Done"
  end
end