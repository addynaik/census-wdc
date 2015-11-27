raceService = ($http, acs_url, tableauService, statesService, countiesService, congressionalDistrictService)->

  selectedDataType = "zip"

  variables =
    DP05_0028E: 'Total'
    DP05_0032E: 'White'
    DP05_0033E: 'Black or African American'
    DP05_0034E: 'American Indian and Alaska Native'
    DP05_0039E: 'Asian'
    DP05_0047E: 'Native Hawaiian and Other Pacific Islander'
    DP05_0052E: 'Some other race'
    DP05_0053E: 'Two or more races'

  fields = for key, value of variables
    value
  types = for [1..9]
    'integer'
  dataConfiguration =
    zip:
      fieldNames: fields.concat ['Zip Code']
      fieldTypes: types

  getColumnHeaders = ->
    dataConfiguration[selectedDataType]

  getData = (dataType)->
    selectedDataType = dataType
    callback = null
    byString = null
    switch selectedDataType
      when "zip"
        callback = getZipCodeData
        byString = "Zipcodes"
    connectionData =
      name: "ACS 5 Year Race population data by #{byString}"
      data: ""

    tableauService.submit getColumnHeaders(), callback, connectionData
    return

  getZipCodeData = (dummyLastRecordIndicator)->

    fields = for key, value of variables
      key
    console.log fields

    $http.get acs_url,
      params:
        get: fields.join(",")
        for: 'zip code tabulation area:*'
    .then (response)->
      tableauService.pushData response.data[1..], response.data[1..].length.toString(), false
      return
    return

  return {
    getData: getData
  }

angular
  .module 'censusApp.acs'
  .factory 'raceService', raceService
  .config [
    '$httpProvider'
    ($httpProvider)->
        $httpProvider.defaults.useXDomain = true
        delete $httpProvider.defaults.headers.common['X-Requested-With']
  ]

raceService.$inject = ['$http', 'acs_url', 'tableauService', 'statesService', 'countiesService', 'congressionalDistrictService']
