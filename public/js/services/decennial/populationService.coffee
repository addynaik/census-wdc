statePopulationService = ($http, census_url, tableauService, statesService)->

  selectedState = "24"
  selectedDataType = "zip"

  dataConfiguration =
    zip:
      fieldNames: ['Population', 'Zipcode', 'State']
      fieldTypes: ['integer', 'integer', 'string']
    tract:
      fieldNames: ["Population", "State", "County", "Tract", "Block Group"]
      fieldTypes: ['integer', 'string', 'string', 'string', 'string']
    congressionaldistricts:
      fieldNames: ["Population", "State", "Congressional District", "Congressional District Code"]
      fieldTypes: ['integer', 'string', 'string', 'string']

  getColumnHeaders = ->
    dataConfiguration[selectedDataType]

  getData = (state, dataType)->
    selectedState = state
    selectedDataType = dataType
    switch selectedDataType
      when "zip"
        tableauService.submit getColumnHeaders(), getZipData
      # when "tract"
      #   getTractData(lastRecordToken)
      # when "congressionaldistricts"
      #   getCongressionalDistrictData()
    return

  getZipData = (lastRecordIndicator)->
    inVariable = "state:"+selectedState.id

    $http.get census_url,
      params:
        get: 'P0010001'
        for: 'zip code tabulation area:*'
        in: inVariable
    .then (response)->
      dataToReturn = []
      for row in response.data[1..]
        dataToReturn.push [row[0], row[2], statesService.getState(row[1]).name]
      tableauService.pushData dataToReturn, dataToReturn.length.toString(), false
    return

  return {
    getData: getData
  }

angular
  .module 'censusApp.decennial'
  .factory 'statePopulationService', statePopulationService


statePopulationService.$inject = ['$http', 'census_url', 'tableauService','statesService']
