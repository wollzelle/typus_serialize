class Typus.Serialize.Models.Item extends Backbone.Model
  
  initialize: ->
    # create properties for each key 
    # but don't overwrite them if they already exist
    for key in @collection.keys
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