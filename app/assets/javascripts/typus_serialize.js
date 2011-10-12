/* 
*= require underscore
*= require backbone
*= require jquery.ui
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
  this.options = options;
  this.element = element;
  this.data = options.data;
  this.collection = new Typus.Serialize.Collections.Set(null, options);
  this.collection.reset(this.data);
  this.view = new Typus.Serialize.Views.Set({ el: this.element, collection: this.collection });
};

$.widget.bridge("typusSerialize", Typus.Serializer);