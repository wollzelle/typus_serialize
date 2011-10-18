Typus.Serialize.Views.Item = Backbone.View.extend({
  
  tagName: 'li',
  
  className: 'serial-item serial-input',
  
  template: JST['templates/item'],
  
  events: {
    'click .serial-remove-button': 'removeItem'
  },
  
  initialize: function(){
    this.model.bind('remove', _.bind(this.onRemove, this));
    this.render();
  },
  
  render: function(){
    $(this.el).html(this.template({ model: this.model }));
  },
  
  removeItem: function(e){
    e.preventDefault();
    this.model.collection.remove(this.model);
  },

  onRemove: function(){
    $(this.el).slideUp('fast', function(){
      $(this).remove();
    });
  }

});