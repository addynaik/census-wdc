tableauService = ($window)->
  tableau = $window.tableau
  censusConnector = null
  options =
    columnHeaders:
      fieldNames: []
      fieldTypes: []
    tableDataCallback: ->
      return

  pushData = (dataToReturn, lastRecordIndicator, more)->
    tableau.dataCallback dataToReturn, lastRecordIndicator, more
    return

  submit = (incolumnHeaders, intableDataCallback)->
    options['columnHeaders'] = incolumnHeaders
    options['tableDataCallback'] = intableDataCallback
    initiateTableau()
    tableau.submit()
    return

  initiateTableau = ->
    censusConnector = tableau.makeConnector()
    censusConnector.getColumnHeaders = ->
      fieldNames = options['columnHeaders']['fieldNames']
      fieldTypes = options['columnHeaders']['fieldTypes']
      tableau.headersCallback(fieldNames, fieldTypes)
      return
    censusConnector.getTableData = options['tableDataCallback']
    tableau.registerConnector(censusConnector)
    return

  initiateTableau()

  return {
    submit: submit
    pushData: pushData
  }

angular
  .module 'censusApp.tableau'
  .factory 'tableauService', tableauService

tableauService.$inject = ['$window']
