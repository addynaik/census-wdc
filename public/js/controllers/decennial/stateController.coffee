StateController = (statesService, statePopulationService, tableauService) ->
  $("ul.nav .active").removeClass("active")
  $("li.decennial").addClass("active")

  vm = this
  vm.states = []
  vm.dataType = 'zip'

  vm.getData = ->
    statePopulationService.getData vm.selectedState, vm.dataType
    return

  activateView = (states)->
    vm.states = states
    vm.selectedState = statesService.getState("24")
    return

  getStates = ->
    states = statesService.getStates()
    if states.length == 0
      statesService.downloadStatePromise()
        .then (data)->
          activateView(data)
    else
      activateView(states)
    return

  getStates()

  return

angular
  .module 'censusApp.decennial'
  .controller 'stateController', StateController

StateController.$inject = ['statesService', 'statePopulationService', 'tableauService']
