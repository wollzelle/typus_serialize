class Typus.Serialize.Views.Item extends Backbone.View
  
  tagName: 'li'
  
  className: 'serial-item serial-input'
  
  template: JST['typus_serialize/templates/item']
  
  events:
    'click .serial-remove-button': 'removeItem'
  
  initialize: ->
    @el = $(@el)
    @model.bind('remove', @onRemove)
    @render()
  
  render: ->
    $(@el).html(@template({ @model }))
  
  removeItem: (e) ->
    @model.collection.remove(@model)
    e.preventDefault()

  onRemove: =>
    @el.slideUp('fast', -> $(@).remove())