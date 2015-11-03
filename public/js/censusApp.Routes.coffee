angular
  .module 'censusApp.Routes', []
  .config [
    '$routeProvider'
    '$locationProvider'
    ($routeProvider, $locationProvider) ->
      $routeProvider
      .when '/',
        templateUrl: 'views/decennial/by-state.html'
        controller: 'DecennialByStateController'
      .when '/decennial',
        templateUrl: 'views/decennial/by-state.html'
        controller: 'DecennialByStateController'
      $locationProvider.html5Mode true
      return
  ]
