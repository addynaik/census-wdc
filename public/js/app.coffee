angular
  .module 'censusApp', [
    'ngRoute'
    'ui.bootstrap'
    'censusApp.routes'
    'censusApp.tableau'
    'censusApp.common'
    'censusApp.decennial'
    'censusApp.acs'
  ]
  .constant('decennial_url', 'http://api.census.gov/data/2010/sf1')
  .constant('acs_url','http://api.census.gov/data/2013/acs5/profile')
  .config [
    '$httpProvider'
    ($httpProvider)->
        $httpProvider.defaults.useXDomain = true
        delete $httpProvider.defaults.headers.common['X-Requested-With']
  ]
