uniofbath-deploy
==========

Gem for Mina deployment scripts

### Helper usage

`uniofbath_deploy init` - create config/deploy.rb and a basic config/deployments/digilin01.rb
`uniofbath_deploy generate` - create a new deployment file config/deployments/new.rb which can be renamed

* Run the `uniofbath_deploy init`, then edit `deploy.rb` to update `repository` (and `default_server` if necessary).
* Rename `digilin01.rb` file to your environment name and update the contents

The `generate` command can be used to create additional deployment files if needed.

See also https://wiki.bath.ac.uk/display/webservices/Ruby+deployment+Gem
