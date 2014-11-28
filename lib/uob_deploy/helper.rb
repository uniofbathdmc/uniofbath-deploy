class UobDeploy

  # create the deploy.rb file and deployments directory
  def self.init
    puts "Checking config directory"
    unless Dir.exists?('config')
      puts "Creating directory"
      Dir.mkdir('config')
    end

    puts "Creating config/deploy.rb"

    puts "Checking config/deployments directory"
    unless Dir.exists?('config/deployments')
      puts "Creating directory"
      Dir.mkdir('config/deployments')
    end

    puts "Creating basic deployment file"

    puts "Done"
  end

  # create a new environment file
  def self.new
    puts "Checking config/deployments"

    puts "Creating basic deployment file"
  end
end