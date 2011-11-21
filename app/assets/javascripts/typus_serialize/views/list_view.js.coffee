class Typus.Serialize.Views.List extends Backbone.View

  events:
    'click .serial-add-button': 'addItem'

  initialize: (options) ->
    @el = $(@el)
    @collection = options.collection
    @list = @el.find('.serial-list')
    @addButton = @el.find('.serial-item-add')
    @collection.bind('add',  @onAdd)
    @collection.bind('remove', @onRemove)
    @collection.bind('reset', @onReset)
    @collection.bind('limit:one', @onOne)
    @collection.bind('limit:min', @onMinimum)
    @collection.bind('limit:max', @onMaximum)
    @makeSortable()
    # @onReset()

  onAdd: (model) =>
    item = new Typus.Serialize.Views.Item({ model }).el
    @addButton.before(item)
    @el.find('.serial-remove-button').show()
    @el.find('.serial-drag-handle').show()

  onReset: =>
    @collection.each(@onAdd)
    @triggerRefresh()
  
  onRemove: (model) =>
    @addButton.show()
    template = JST['typus_serialize/templates/empty']
    if @collection.length == 0
      @list.append(template({ name: @collection.name }))

  onMinimum: =>
    @el.find('.serial-remove-button').hide()

  onMaximum: =>
    @addButton.hide()
  
  onOne: =>
    @el.find('.serial-drag-handle').hide()

  addItem: (e) ->
    e.preventDefault()
    @collection.add()
    @triggerRefresh()    

  triggerRefresh: ->
    $(window).trigger('translate:refresh')

  makeSortable: ->
    @el.sortable({
      items: '.serial-input'
      handle: '.serial-drag-handle'
      cursor: 'move'
      helper: 'clone'
      revert: 50
    })
