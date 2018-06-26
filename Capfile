# default deploy_config_path is 'config/deploy.rb'
set :deploy_config_path, File.expand_path('capistrano/deploy.rb')

# default stage_config_path is 'config/deploy'
set :stage_config_path, 'capistrano/stages'

# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"
#require 'capistrano/composer'

# Load the SCM plugin:
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
# default tasks path is `lib/capistrano/tasks/*.rake`
# (note that you can also change the file extensions)
Dir.glob('capistrano/tasks/*.rb').each { |r| import r }