uob-deploy
==========

Gem for Mina deployment scripts

## To use

* Add to Gemfile:
```
gem 'uob_deploy', git: 'https://b4172fb971070096d38c12e67e0d52bddaf54698:x-oauth-basic@github.bath.ac.uk/digital/uob-deploy.git'
```
* `bundle install`
* Create the necessary config files: `uob_deply init`
* Update the `repository` variable in `config/deploy.rb`
* Update the settings in the build environment `config/deployments/digilin01.rb`
* Ready to Mina!

### Optional
* Create a new deployment file: `uob_deploy new`
