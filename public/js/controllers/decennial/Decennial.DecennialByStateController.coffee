DecennialByStateController = (statesService) ->
  vm = this
  vm.states = [];


  activateView = ->
    getStates()
    
  getStates = () ->
    statesService.getStates()
      .then (data)->
        vm.states = data
        vm.states

  activateView()


  # vm.states = statesService.getStates()
  # # vm.selectedState = CensusData.getState("24")
  #
  # $("#state").change ->
  #   console.log $("#state").val()
  return

angular
  .module 'censusApp.Decennial'
  .controller 'DecennialByStateController', DecennialByStateController

DecennialByStateController.$inject = ['statesService']
