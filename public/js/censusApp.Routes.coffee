angular
  .module 'censusApp.Routes', []
  .config [
    '$routeProvider'
    '$locationProvider'
    ($routeProvider, $locationProvider) ->
      $routeProvider
      .when '/',
        templateUrl: 'views/decennial/by-state.html'
      .when '/decennial',
        templateUrl: 'views/decennial/by-state.html'
      $locationProvider.html5Mode true
      return
  ]
