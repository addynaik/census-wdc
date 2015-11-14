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
        redirectTo: '/decennial/by-state'
      .when '/decennial/by-state',
        templateUrl: 'views/decennial/by-state.html'
        resolve:
          'statesService' : (statesService)->
            statesService.downloadStatePromise()
          'countiesService' : (countiesService)->
            countiesService.downloadCountiesPromise()
          'congressionalDistrictService' : (congressionalDistrictService)->
            congressionalDistrictService.downloadCongressionalDistrictsPromise()
      .when '/acs',
        redirectTo: '/acs/by-race'
      .when '/acs/by-race',
        templateUrl: 'views/acs/by-race.html'

      $locationProvider.html5Mode true
      return
  ]
