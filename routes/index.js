var index = {};
index.index = index;

function index(req, res, next) {
  res.render('index', { title: 'Express' });
}

module.exports = {
  index: index,
  user: require('./user')
};
