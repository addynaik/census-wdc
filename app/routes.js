module.exports = function(app) {
  app.get('*', function(req, res) {
    return res.sendFile('views/index.html', {
      root: './.public'
    });
  });
};
