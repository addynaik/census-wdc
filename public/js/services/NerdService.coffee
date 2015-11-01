angular.module('NerdService', []).factory 'Nerd', [
  '$http'
  ($http) ->
    {
      get: ->
        $http.get '/api/nerds'
      create: (nerdData) ->
        $http.post '/api/nerds', nerdData
      'delete': (id) ->
        $http['delete'] '/api/nerds/' + id

    }
]
