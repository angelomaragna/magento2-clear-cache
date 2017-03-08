#!/bin/bash
echo Restoring ownerships
sudo chown -R dev:www-data ./
echo "Clearing cache..."
sudo rm -rf var/cache/ && sudo rm -rf var/generation/ && sudo rm -rf var/di/ && sudo rm -rf var/page_cache/ && sudo rm -rf var/view_preprocessed/
echo "Compiling dependency injection..."
php bin/magento setup:di:compile
echo "Deploying static content..."
php bin/magento setup:static-content:deploy
php bin/magento setup:static-content:deploy en_GB
sudo chown -R dev:www-data ./
