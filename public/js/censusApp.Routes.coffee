angular
  .module 'censusApp.routes', []
  .config [
    '$routeProvider'
    '$locationProvider'
    ($routeProvider, $locationProvider) ->
      $routeProvider
      .when '/',
        redirectTo: '/decennial'
      .when '/decennial',
        templateUrl: 'views/decennial/by-state.html'
        resolve:
          'statesService' : (statesService)->
            statesService.downloadStatePromise()
      $locationProvider.html5Mode true
      return
  ]
