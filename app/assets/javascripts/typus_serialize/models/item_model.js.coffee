class Typus.Serialize.Models.Item extends Backbone.Model
  
  initialize: ->
    keys = this.collection.keys
    # create properties for each key 
    # but don't overwrite them if they already exist
    for key in keys
      unless @.get(key)
        @.setByName(key, null)

  baseName: ->
    "#{@.collection.baseName}[#{@.cid}]"
  
  setByName: (key, value) =>
    setter = {}
    setter[key] = value
    @.set(setter)