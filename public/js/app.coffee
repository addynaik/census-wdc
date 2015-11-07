angular
  .module 'censusApp', [
    'ngRoute'
    'censusApp.routes'
    'censusApp.decennial'
    'censusApp.tableau'
  ]
  .constant('census_url', 'http://api.census.gov/data/2010/sf1')
