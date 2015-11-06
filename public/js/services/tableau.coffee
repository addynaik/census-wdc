tableauService = ($window)->
  tableau = $window.tableau

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

  getData = (state, dataType)->
    tableau.submit();

  getColumnHeaders = ->

  getCensusData = (lastRecord)->

  censusConnector = tableau.makeConnector();
  censusConnector.getColumnHeaders = getColumnHeaders
  censusConnector.getTableData = getCensusData
  tableau.registerConnector(censusConnector)

  init = ->
    console.log "init"

  return {
    init: init
  }

angular
  .module 'tableau'
  .factory 'tableauService', tableauService

tableauService.$inject = ['$window']
