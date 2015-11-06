DecennialByStateController = (statesService, tableauService) ->
  vm = this
  vm.states = []
  vm.dataType = 'zip'

  vm.getData = ->
    tableauService.getData vm.selectedState, vm.dataType

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
  .module 'censusApp.Decennial'
  .controller 'DecennialByStateController', DecennialByStateController

DecennialByStateController.$inject = ['statesService', 'tableauService']
