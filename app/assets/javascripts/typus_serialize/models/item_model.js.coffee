class Typus.Serialize.Models.Item extends Backbone.Model
  
  initialize: ->
    # create properties for each key 
    # but don't overwrite them if they already exist
    for key in @collection.keys
      unless @get(key)
        @setByName(key, null)

  name: ->
    "#{@collection.name}[#{@cid}]"
  
  setByName: (key, value) =>
    setter = {}
    setter[key] = value
    @set(setter)