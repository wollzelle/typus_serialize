/* 
*= require underscore
*= require backbone
*= require jquery-ui
*= require_self
*= require_tree ./models
*= require_tree ./collections
*= require_tree ./templates
*= require_tree ./views
*/

window.Typus = Typus || {};

Typus.Serialize = {
  Models: {},
  Collections: {},
  Views: {}
};

Typus.Serializer = function(options, element){
  var collection = new Typus.Serialize.Collections.List(null, options);
  new Typus.Serialize.Views.List({ el: element, collection: collection });
  collection.reset(options.data);
};

$.widget.bridge("typusSerialize", Typus.Serializer);