var indexRoute = {};
indexRoute.index = index;

function index(req, res, next) {
  res.render('index', { title: 'Express' });
}

module.exports = {
  index: indexRoute,
  user: require('./user')
};
