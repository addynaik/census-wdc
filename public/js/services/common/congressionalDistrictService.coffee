congressionalDistrictService = ($http)->
  congressionalDistricts = {}

  getCongressionalDistrict = (stateID, congressionalDistrictID)->
    congressionalDistricts[stateID][parseInt(congressionalDistrictID).toString()]

  downloadCongressionalDistrictsPromise = ->
    parseCongressionalDistricts = (response)->
      data = response.data
      for stateID,congressionalDistrictData of data
        congressionalDistricts[stateID] ||= {}
        for congressionalDistrictID,congressionalDistrict of congressionalDistrictData
          congressionalDistricts[stateID][congressionalDistrictID] =
            id: congressionalDistrictID
            name: congressionalDistrict
      return

    parseCongressionalDistrictsFailed = (error)->
      #console.log 'XHR Failed for congressionalDistrictService.' + error
      return

    return $http.get '/json/congressionaldistricts.json'
      .then parseCongressionalDistricts
      .catch parseCongressionalDistrictsFailed

  return {
    downloadCongressionalDistrictsPromise: downloadCongressionalDistrictsPromise
    getCongressionalDistrict: getCongressionalDistrict
  }

angular
  .module 'censusApp.common'
  .factory 'congressionalDistrictService', congressionalDistrictService

congressionalDistrictService.$inject = ['$http']
