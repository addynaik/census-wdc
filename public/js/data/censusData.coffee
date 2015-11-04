# class CensusData
#   @states = []
#   @counties = {}
#   @subdivisions = {}
#   @congressionalDistricts = {}
#
#   @populateStates: (data)->
#     stateWithCodes = data[0]
#     stateWithNames = data[1]
#     for key,value of stateWithCodes
#       @states[key] = new State key, value, stateWithNames[value]
#     return
#
#   @getAllStates: ->
#     # @populateStates()
#     state for k, state of @states
#
#   @getState: (stateCode)->
#     # @populateStates()
#     @states[stateCode]
#
#   @is_empty = (obj) ->
#     return true if not obj? or obj.length is 0
#     return false if obj.length? and obj.length > 0
#     for key of obj
#         return false if Object.prototype.hasOwnProperty.call(obj,key)
#     return true
#
#
# class State
#   id = null # numeric code
#   code = null # 2 digit alpha code
#   name = null # name
#
#   constructor: (id, code, name)->
#     @id = id
#     @code = code
#     @name = name
#
#   # @getCounty: (stateCode, countyCode)->
#   #   @counties[stateCode][countyCode]
#   #
#   # @getSubdivisions: (stateCode, countyCode, subdivisionCode)->
#   #   @subdivisions[stateCode][countyCode][subdivisionCode]
#   #
#   # @getCongressionalDistrict: (stateCode, congressionalDistrictCode)->
#   #   @congressionalDistricts[stateCode][parseInt(congressionalDistrictCode).toString()]
#
#   # @init: ->
#   #   $.ajax "/json/states.json",
#   #     method: 'GET'
#   #     success: (data)->
#   #       CensusData.states = data
#   #       return
#   #   $.ajax "/json/counties.json",
#   #     method: 'GET'
#   #     success: (data)->
#   #       CensusData.counties = data
#   #       return
#   #   $.ajax "/json/subdivisions.json",
#   #     method: 'GET'
#   #     success: (data)->
#   #       CensusData.subdivisions = data
#   #       return
#   #   $.ajax "/json/congressionaldistricts.json",
#   #     method: 'GET'
#   #     success: (data)->
#   #       CensusData.congressionalDistricts = data
#   #       return
