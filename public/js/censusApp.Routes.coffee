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
      $locationProvider.html5Mode true
      return
  ]
