RaceController =  (raceService)->
  $("ul.nav .active").removeClass("active")
  $("li.acs").addClass("active")

  vm = this
  vm.dataType = 'zip'

  vm.getData = ->
    raceService.getData vm.dataType
    return

  return

angular
  .module 'censusApp.acs'
  .controller 'raceController', RaceController

RaceController.$inject = ['raceService']
