angular.module('appRoutes', []).config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/',
      templateUrl: 'views/decennial/by-state.html'
      controller: 'DecennialController'
    .when '/decennial/by-state',
      templateUrl: 'views/decennial/by-state.html'
      controller: 'DecennialController'
    $locationProvider.html5Mode true
    return
]
