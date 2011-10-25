class Typus.Serialize.Collections.List extends Backbone.Collection

  model: Typus.Serialize.Models.Item
  
  initialize: (models, options) ->
    @baseName = options.baseName
    @keys = options.keys
    @min = options.limit.min or 0
    @max = options.limit.max or Infinity
  
  add: (models, options) ->
    if @length < @max
      super(models, options)

    if @length >= @max
      @trigger('limit:max', @)
  
  remove: (models, options) ->
    if @length > @min
      super(models, options)

    if @length <= @min
      @trigger('limit:min', @)

    if @length is 1
      @trigger('limit:one', @)
  
  reset: (models, options) ->
    options or (options = {})
  
    # don't trigger reset yet, as we might add more models...
    super(models, { silent: true })

    if @length < @min
      # add more models
      count = @min - @length
      _(count).times(=> @add(null, { silent: true }))

    # now lets trigger reset if we should...
    if !options.silent
      @trigger('reset', @, options)

    if @length <= @min
      @trigger('limit:min', @)

    if @length is 1
      @trigger('limit:one', @)