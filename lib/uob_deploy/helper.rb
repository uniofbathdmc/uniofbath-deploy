require 'fileutils'

class UobDeploy

  @config_dir = 'config'
  @deployments_dir = File.join(@config_dir, 'deployments')
  @templates_dir = File.join(File.dirname(__FILE__), '../templates/')
  @deployments_template = File.join(@templates_dir, 'digilin01.rb')

  # create the deploy.rb file and deployments directory
  def self.init
    # create a config directory if there isn't one already
    FileUtils.mkdir_p(@deployments_dir)

    puts "Creating config/deploy.rb"
    unless File.exists?(@deployments_template)
      # FileUtils.cp(@deployments_template, @deployments_dir)
    end

    puts "Creating basic deployment file"
    unless File.exists?(@deployments_template)
      FileUtils.cp(@deployments_template, @deployments_dir)
    end

    puts "Done"
  end

  # create a new environment file
  def self.new
    puts "Checking config/deployments"

    puts "Creating basic deployment file"
  end
end