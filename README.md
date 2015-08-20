uniofbath-deploy
==========

Gem for Mina deployment scripts

### Script usage

* `mina setup` - set up the target server
* `mina deploy` - deploy to the target server and start application

*Options:*

* `to=staging` - target the specified environment
* `migrate=false` - do not run db:migrate (in deploy)

### Settings

In addition to Mina settings you can set:

* `:symlink_paths`

Example (to... from):

```
set :symlink_paths, [['/tmp/attachments', 'public/attachments'], ['/tmp/foo', 'public/foo']]
```

### Helper usage

`uniofbath_deploy init` - create config/deploy.rb and a basic config/deployments/digilin01.rb
`uniofbath_deploy generate` - create a new deployment file config/deployments/new.rb which can be renamed

* Run the `uniofbath_deploy init`, then edit `deploy.rb` to update `repository` (and `default_server` if necessary).
* Rename `digilin01.rb` file to your environment name and update the contents

The `generate` command can be used to create additional deployment files if needed.

See also https://wiki.bath.ac.uk/display/webservices/Ruby+deployment+Gem
