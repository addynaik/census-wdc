# grab the nerd model we just created
Nerd = require('./models/nerd')

module.exports = (app)->

  # server routes ===========================================================
  # handle things like api calls
  # authentication routes

  # sample api route
  app.get '/api/nerds', (req, res)->
    # use mongoose to get all nerds in the database
    Nerd.find (err, nerds)->
      # if there is an error retrieving, send the error.
      # nothing after res.send(err) will execute
      if err
        res.send err

      res.json nerds

  # route to handle creating goes here (app.post)
  # route to handle delete goes here (app.delete)

  # frontend routes =========================================================
  # route to handle all angular requests
  app.get '*', (req, res)->
    res.sendFile 'views/index.html',
      root: './.public'
      # load our public/index.html file
