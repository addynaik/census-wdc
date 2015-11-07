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
          'countiesService' : (countiesService)->
            countiesService.downloadCountiesPromise()
          'congressionalDistrictService' : (congressionalDistrictService)->
            congressionalDistrictService.downloadCongressionalDistrictsPromise()

      $locationProvider.html5Mode true
      return
  ]
