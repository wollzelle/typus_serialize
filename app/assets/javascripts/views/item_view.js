Typus.Serialize.Views.Item = Backbone.View.extend({
  
  template: JST['templates/item'],
  
  events: {
    'click .serial-remove-button': 'removeItem'
  },
  
  initialize: function(){
    this.model.bind('remove',_.bind(this.onRemove, this));
    this.render();
  },
  
  render: function(){
    $(this.el).html(this.template({ model: this.model }));
  },
  
  removeItem: function(e){
    e.preventDefault();
    this.model.collection.remove(this.model);
  },

  onRemove: function(model){
    this.remove();
  }

});