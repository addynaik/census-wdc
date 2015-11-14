RaceController = (tableauService) ->
  $("ul.nav .active").removeClass("active")
  $("li.acs").addClass("active")

  vm = this
  vm.dataType = 'zip'

angular
  .module 'censusApp.acs'
  .controller 'raceController', RaceController

RaceController.$inject = ['tableauService']
