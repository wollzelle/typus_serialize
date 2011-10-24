class Typus.Serialize.Views.Item extends Backbone.View
  
  tagName: 'li'
  
  className: 'serial-item serial-input'
  
  template: JST['typus_serialize/templates/item']
  
  events:
    'click .serial-remove-button': 'removeItem'
  
  initialize: ->
    @.model.bind('remove', @.onRemove)
    @.render()
  
  render: ->
    $(@.el).html(@.template({ @model }))
  
  removeItem: (e) ->
    e.preventDefault()
    @.model.collection.remove(@.model)

  onRemove: =>
    $(@.el).slideUp('fast', -> $(@).remove())