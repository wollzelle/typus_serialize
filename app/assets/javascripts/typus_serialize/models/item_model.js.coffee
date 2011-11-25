class Typus.Serialize.Models.Item extends Backbone.Model
  
  initialize: ->
    @setKeys()

  setKeys: ->
    # create properties for each key 
    for key in @collection.keys
      # but don't overwrite them if they already exist
      unless @get(key)
        @setByName(key, null)

  name: (locale) ->
    if locale
      "#{@collection.name[locale]}[]"
    else
      "#{@collection.name}[]"
  
  value: (key, locale) ->
    if locale
      @get(key)?[locale]
    else
      @get(key)

  humanize: (key) ->
    _.str.humanize(key)

  setByName: (key, value) =>
    setter = {}
    setter[key] = value
    @set(setter)