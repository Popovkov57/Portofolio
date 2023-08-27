#!/bin/bash
set -e

echo "Deployment started..."

git pull
echo "New changes copied to server !"

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

echo "Installing Node 20"
nvm install 20

echo "Use Node 20"
nvm use 20

echo "Installing Angular cli"
npm install -g @angular/cli

echo "Installing Dependencies..."
npm install --yes

echo "Creating Production Build..."
ng build

echo "Deployment Finished!"