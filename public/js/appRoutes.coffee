angular.module('appRoutes', []).config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/',
      templateUrl: 'views/decennial/by-state/zip.html'
      controller: 'DecennialController'
    .when '/nerds',
      templateUrl: 'views/nerd.html'
      controller: 'NerdController'
    $locationProvider.html5Mode true
    return
]
