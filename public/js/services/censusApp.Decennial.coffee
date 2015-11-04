
statesService = ($http)->
  states = {}

  getStates = ()->
    parseStates = (response)->
      stateWithCodes = response.data[0]
      stateWithNames = response.data[1]
      for key,value of stateWithCodes
        states[key] = new State key, value, stateWithNames[value]
      state for key, state of states

    parseStatesFailed = (error)->
      console.log 'XHR Failed for getAvengers.' + error.data

    return $http.get '/json/states.json'
      .then parseStates
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
  }

angular
  .module 'censusApp.Decennial'
  .factory 'statesService', statesService

statesService.$inject = ['$http']
