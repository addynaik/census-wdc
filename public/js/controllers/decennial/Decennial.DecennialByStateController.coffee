DecennialByStateController = (statesService) ->
  vm = this
  vm.states = [];


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

DecennialByStateController.$inject = ['statesService']
