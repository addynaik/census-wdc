angular
  .module 'censusApp.Decennial'
  .controller 'DecennialByStateController', [
    '$scope'
    '$http'
    ($scope,$http) ->
      if CensusData.is_empty CensusData.getAllStates()
        $http.get('/json/states.json').success(
          (data)->
            CensusData.populateStates data
            $scope.states = CensusData.getAllStates()
            $scope.selectedState = CensusData.getState("24")
        )

      $("#state").change ->
        console.log $("#state").val()
      return
  ]
