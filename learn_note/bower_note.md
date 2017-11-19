- [bower](https://bower.io/)
- [Bower is used together with other tools to integrate with all sorts of setups and workflows.](https://bower.io/docs/tools/)

```bash
npm install -g bower

# Bower requires node, npm and git.

```

```bash
## bower install <package>

# installs the project dependencies listed in bower.json
bower install
# registered package
bower install jquery
# GitHub shorthand
bower install desandro/masonry
# Git endpoint
bower install git://github.com/user/package.git
# URL
bower install http://example.com/script.js
```

- [bower.json](https://bower.io/docs/creating-packages/#bowerjson)
- [bower.json specification](https://github.com/bower/spec/blob/master/json.md)

```bash
# install package and add it to bower.json dependencies
bower install jquery --save

# install package and add it to bower.json devDependencies
bower install jquery --save-dev
```

- [Grunt](https://bower.io/docs/tools/)

- [grunt-bower-task](https://github.com/yatskevich/grunt-bower-task)

- [configure node express to serve static bower_components?](https://stackoverflow.com/questions/21821773/configure-node-express-to-serve-static-bower-components)
```node
app.use(express.static(__dirname + '/public'));
app.use('/bower_components',  express.static(path.join(__dirname, '/bower_components')));

//So any Bower components are loaded from HTML like this:
// <script src="/bower_components/..."></script>
```




