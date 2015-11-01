angular.module('appRoutes', []).config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/',
      templateUrl: 'views/decennial/by-state/zip.html'
      controller: 'DecennialController'
    $locationProvider.html5Mode true
    return
]
