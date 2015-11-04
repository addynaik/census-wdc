
statesService = ($http)->
  states = {}

  getStatesValues = ->
    state for key, state of states

  getState = (stateID)->
    return states[stateID]

  getStates = ->
    getStatesValues()


  downloadStates = ->
    parseStates = (response)->
      stateWithCodes = response.data[0]
      stateWithNames = response.data[1]
      for key,value of stateWithCodes
        states[key] = new State key, value, stateWithNames[value]

    parseStatesFailed = (error)->
      console.log 'XHR Failed for getAvengers.' + error.data

    return $http.get '/json/states.json'
      .then parseStates
      .then getStatesValues
      .catch parseStatesFailed

  class State
    id = null # numeric code
    code = null # 2 digit alpha code
    name = null # name

    constructor: (id, code, name)->
      @id = id
      @code = code
      @name = name

  return {
    getStates: getStates
    getState: getState
    downloadStates: downloadStates
  }

angular
  .module 'censusApp.Decennial'
  .factory 'statesService', statesService

statesService.$inject = ['$http']
