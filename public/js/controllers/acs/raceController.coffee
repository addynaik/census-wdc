RaceController = (tableauService) ->
  vm = this
  vm.dataType = 'zip'
  $("ul.nav .active").removeClass("active")
  $("li.acs").addClass("active")

angular
  .module 'censusApp.acs'
  .controller 'raceController', RaceController

RaceController.$inject = ['tableauService']
