class Typus.Serialize.Views.List extends Backbone.View

  events:
    'click .serial-add-button': 'addItem'

  initialize: (options) ->
    @.collection = options.collection
    @.list = @.$('.serial-list')
    @.addButton = @.$('.serial-item-add')
    @.collection.bind('add',  @.onAdd)
    @.collection.bind('remove', @.onRemove)    
    @.collection.bind('reset', @.onReset)   
    @.collection.bind('limit:one', @.onOne)
    @.collection.bind('limit:min', @.onMinimum)
    @.collection.bind('limit:max', @.onMaximum)
    @.makeSortable()
    @.onReset()

  onAdd: (model) =>
    item = new Typus.Serialize.Views.Item({ model }).el
    @.addButton.before(item)
    @.$('.serial-remove-button').show()
    @.$('.serial-drag-handle').show()
  
  onReset: =>
    @.collection.each(@.onAdd)
  
  onRemove: (model) =>
    @.addButton.show()
    template = JST['typus_serialize/templates/empty']
    if @.collection.length == 0
      $(@.list).append(template({ base_name: @.collection.baseName }))

  onMinimum: =>
    @.$('.serial-remove-button').hide()

  onMaximum: =>
    @.addButton.hide()
  
  onOne: =>
    @.$('.serial-drag-handle').hide()

  addItem: (e) ->
    @.collection.add()
    e.preventDefault()

  makeSortable: ->
    opts =
      items: '.serial-input'
      handle: '.serial-drag-handle'
      cursor: 'move'
      helper: 'clone'
      revert: 50
    
    $(@.el).sortable(opts)
