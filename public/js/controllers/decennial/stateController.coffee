StateController = (statesService, statePopulationService) ->
  vm = this
  vm.states = []
  vm.dataType = 'zip'

  vm.getData = ->
    statePopulationService.getData vm.selectedState, vm.dataType

  activateView = (states)->
    vm.states = states
    vm.selectedState = statesService.getState("24")

  getStates = ->
    states = statesService.getStates()
    if states.length == 0
      statesService.downloadStates()
        .then (data)->
          activateView(data)
    else
      activateView(states)

  getStates()

  return

angular
  .module 'censusApp.decennial'
  .controller 'stateController', StateController

StateController.$inject = ['statesService', 'statePopulationService']
