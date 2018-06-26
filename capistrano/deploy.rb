# !! When editing the file (or defining the configurations),
#    you can either comment them out or add the new lines.
#    Make sure to **not** to have some example settings
#    overriding the ones you are appending.

# Define the name of the application
set :application, 'yii-application'

# Define where can Capistrano access the source repository
# set :repo_url, 'https://github.com/[user name]/[application name].git'
#set :scm, :git
set :repo_url, 'https://github.com/chakAs3/yii2-docker.git'

# Define where to put your application code
set :deploy_to, "/var/www/yii2-docker"

set :pty, true

set :format, :pretty

# Set your post-deployment settings.
# For example, you can restart your Nginx process
# similar to the below example.
# To learn more about how to work with Capistrano tasks
# check out the official Capistrano documentation at:
# http://capistranorb.com/

# namespace :deploy do
#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       sudo "service nginx restart"
#     end
#   end
# end