PHP Workspace
=============

A set of containers to develop PHP website based on a CMS eg. Wordpress, Joomla or Drupal.

**Features:**
- Uses any image you want, eg. `wordpress:5.2-apache`, but can be a eg. Drupal one
- Bundled MySQL, phpMyAdmin
- Automatically adjusted permissions inside of the container to fit the host permissions
- Deployment to remote FTP
- Automatic file copying on change to the remote FTP

**Example usages:**
- Wordpress plugins development
- Wordpress page creation
- Wordpress theme development
- Drupal page development
- Joomla page development
- Other app/cms plugin/theme development

## Quick start

```
# configure
cp .env.default .env
edit .env

# see available commands
make

# start the environment
make start

# open website in browser
xdg-open http://localhost:9005

# open phpMyAdmin in browser
xdg-open http://localhost:9006

# deploy all files to the remote FTP
make deploy

# watch changes and copy files when they are changed
make watch_and_deploy_on_change

# stop the environment
make stop
```
