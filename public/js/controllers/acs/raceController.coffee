RaceController =  ->
  $("ul.nav .active").removeClass("active")
  $("li.acs").addClass("active")

  vm = this
  vm.dataType = 'zip'

  return

angular
  .module 'censusApp.acs'
  .controller 'raceController', RaceController

RaceController.$inject = []
