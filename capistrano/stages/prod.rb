# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
set :ssh_options, { :forward_agent => true }
role :app, %w{root@206.189.102.179}

# Define server(s)
# Example:
# server '[your droplet's IP addr]', user: '[the deployer user]', roles: %w{[role names as defined above]}
# server '162.243.74.190', user: 'deployer', roles: %w{app}
server '206.189.102.179', user: 'root' , roles: %w{app}

# SSH Options
# See the example commented out section in the file
# for more options.
namespace :system do
    desc "Clean directory before publishing"
    task :cleanup do
      on roles(:app) do
        within release_path  do
            execute :rm, "-f .gitignore"
            execute :rm, "-f Capfile"
            execute :rm, "-rf capistrano"
        end
      end
    end    
    desc "Install Composer"
    task :install_composer do
      on roles(:app) do
        within shared_path  do
            execute "php -r \"copy('http://getcomposer.org/composer.phar', '#{shared_path}/composer.phar');\" 1>&2"
        end
      end
    end
    desc "Composer install "
    task :composer_install do
      on roles(:app) do
        within release_path  do
            execute "php #{shared_path}/composer.phar global require \"fxp/composer-asset-plugin:^1.4.2\" "
            
        end
      end
    end
    desc "Composer install2"
    task :composer_install2 do
      on roles(:app) do
        within release_path  do
            execute:php, "#{shared_path}/composer.phar update"
        end
      end
    end

end

#after "deploy:check:directories", "system:install_composer"
#after "system:install_composer", "system:composer_install"
#after "system:composer_install", "system:composer_install2"
before "deploy:check:directories", "system:cleanup"