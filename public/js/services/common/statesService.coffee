statesService = ($http)->
  states = {}

  getStatesValues = ->
    state for id, state of states

  getState = (stateID)->
    return states[stateID]

  getStates = ->
    getStatesValues()

  downloadStatePromise = ->
    parseStates = (response)->
      stateWithCodes = response.data[0]
      stateWithNames = response.data[1]
      for id, code of stateWithCodes
        states[id] =
          id: id
          code: code
          name: stateWithNames[code]

    parseStatesFailed = (error)->
      #console.log 'XHR Failed for statesService.' + error.data
      return

    return $http.get '/json/states.json'
      .then parseStates
      .catch parseStatesFailed

  return {
    downloadStatePromise: downloadStatePromise
    getStates: getStates
    getState: getState
  }

angular
  .module 'censusApp.decennial'
  .factory 'statesService', statesService

statesService.$inject = ['$http']
