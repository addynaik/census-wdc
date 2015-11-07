countiesService = ($http)->
  counties = {}

  getCountyValues = (stateID)->
    state for key, state of counties[stateID]

  getCounty = (stateID, countyID)->
    counties[stateID][countyID]

  getCounties = ->
    getCountyValues()

  getCountyKeys = (stateID)->
    key for key, state of counties[stateID]

  downloadCountiesPromise = ->
    parseCounties = (response)->
      data = response.data
      for stateID,countiesData of data
        counties[stateID] ||= {}
        for countyID,county of countiesData
          counties[stateID][countyID] = new County countyID, county

    parseCountiesFailed = (error)->
      #console.log 'XHR Failed for countiesService.' + error.data
      return

    return $http.get '/json/counties.json'
      .then parseCounties
      .catch parseCountiesFailed

  class County
    id = null # numeric code
    name = null # name

    constructor: (id, name)->
      @id = id
      @name = name

  return {
    downloadCountiesPromise: downloadCountiesPromise
    getCounties: getCounties
    getCountyKeys: getCountyKeys
    getCounty: getCounty
  }

angular
  .module 'censusApp.decennial'
  .factory 'countiesService', countiesService

countiesService.$inject = ['$http']
