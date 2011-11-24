#= require underscore
#= require underscore.string
#= require backbone
#= require jquery-ui

#= require_self
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./templates
#= require_tree ./views

window.Typus = Typus or {}

Typus.Serialize =
  Models: {}
  Collections: {}
  Views: {}

Typus.Serializer = (options, el) ->    
  collection = new Typus.Serialize.Collections.List(null, options)
  new Typus.Serialize.Views.List({ el, collection })
  collection.reset(options.data)

$.widget.bridge('typusSerialize', Typus.Serializer)