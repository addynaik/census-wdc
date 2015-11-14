angular
  .module 'censusApp.tableau',[]
angular
  .module 'censusApp.common',[]
angular
  .module 'censusApp.decennial', [
    'censusApp.common'
    'censusApp.tableau'
  ]
angular
  .module 'censusApp.acs', [
    'censusApp.common'
    'censusApp.tableau'
  ]
