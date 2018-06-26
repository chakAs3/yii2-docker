set :deploy_to, "/var/nfs/www/" + ENV["CIRCLE_PROJECT_REPONAME"] + "/htdocs/"
set :tmp_dir, "/var/nfs/www/" + ENV["CIRCLE_PROJECT_REPONAME"] + "/htdocs/tmp/"

# TODO nom de la branche à déployer
set :branch, 'develop'

# TODO serveur cible
server "rhinos-vt-preprod-mutu3-filer01.cybersrv.net",

user: ENV["CIRCLE_PROJECT_REPONAME"],

# ne pas changer 
roles: %w{web app}
