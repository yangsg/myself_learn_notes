### [Node Version Manager](https://github.com/creationix/nvm)

```sh
#### install nvm
[test@localhost ~]$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
#--------------------------------output start>------------------------------------------------------------
=> Appending nvm source string to /home/test/.bashrc
=> Appending bash_completion source string to /home/test/.bashrc
=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#--------------------------------output end<--------------------------------------------------------------

[test@localhost ~]$ source ~/.bashrc   #update $PATH
[test@localhost ~]$ command -v nvm     #To verify that nvm has been installed

#### usage of nvm
nvm --help         #this command is useful to show usage and example of nvm
nvm install node   #To download, compile, and install the latest release of node
nvm use node       #

### Example:
nvm ls                                #List installed versions
nvm ls-remote                         #List remote versions available for install
nvm which [<version>]                 #Display path to installed node version. Uses .nvmrc if available

nvm install 8.0.0                     #Install a specific version number
nvm use 8.0                           #Use the latest available 8.0.x release
nvm run 6.10.3 app.js                 #Run app.js using node 6.10.3
nvm exec 4.8.3 node app.js            #Run `node app.js` with the PATH pointing to node 4.8.3
nvm alias default 8.1.0               #Set default node version on a shell
nvm alias default node                #Always default to the latest available node version on a shell

nvm install --lts                     #install the latest LTS(Long-term support) of node
nvm uninstall --lts
nvm use --lts
nvm exec --lts
nvm run --lts
nvm ls-remote --lts
nvm version-remote --lts

```

### new first node project
```sh
mkdir first-project
cd first-project/
npm init              #create package.json file

vim app.js      # https://nodejs.org/en/about/
```

### [Node Inspectora](https://github.com/node-inspector/node-inspector)
```sh
npm install -g node-inspector   #run as root
vim ~/.node-inspectorrc
#-----------------------------
{
  "web-port": 3331,
  "web-host": "192.168.149.128",
  "debug-port": 3332,
  "preload": false,
  "hidden": ["\\.test\\.js$", "node_modules/"]
}
#-----------------------------
node-debug app.js   #then use the Chrome browser to visit http://192.168.149.128:3331/?port=3332 to start debugging.
```

### [npm (nodejs package manager)](https://docs.npmjs.com/)
```sh
### usage of npm
npm help
npm help install     #/example
npm search express   #https://www.npmjs.com/
npm install express  #install express in './node_modules', the global foldler is '/usr/lib/node_modules', run 'npm help 5 npm-folders' for more information
npm install --save express
npm install --save-dev express
npm ls

npm start             #npm run start
npm test              #npm run test
npm run <mycommand>   #run 'mycommand' configured in the "scripts" property in package.json

###Specify configs in the ini-formatted file: ~/.npmrc
#---------------------------------------------
registry = https://registry.npm.taobao.org
#---------------------------------------------

```




