Typus.Serialize.Views.List = Backbone.View.extend({

  events: {
    'click .serial-add-button': 'addItem'
  },

  initialize: function(options) {
    this.collection = options.collection;
    this.list = this.$('.serial-list');
    this.addButton = this.$('.serial-item-add');
    this.collection.bind('add',   _.bind(this.onAdd, this));
    this.collection.bind('remove',_.bind(this.onRemove, this));    
    this.collection.bind('reset', _.bind(this.onReset, this));    
    // this.collection.bind('limit:min', _.bind(this.onMinimum, this));
    // this.collection.bind('limit:max', _.bind(this.onMaximum, this));
    this.makeSortable();
    this.onReset();
  },

  onAdd: function(model){
    var item = new Typus.Serialize.Views.Item({ model: model }).el;
    this.addButton.before(item);
  },
  
  onReset: function(){
    this.collection.each(_.bind(this.onAdd, this));
  },
  
  onRemove: function(model){
    if (this.collection.length == 0) {
      var template = JST['templates/empty'];
      $(this.list).append(template({ base_name: this.collection.baseName }));
    }
  },

  onMinimum: function(){
    // console.log('min');
  },

  onMaximum: function(){
    // console.log('max');
  },

  addItem: function(e){
    this.collection.add();
    e.preventDefault();
  },

  makeSortable: function(){
    $(this.el).sortable({ 
      items  : '.serial-item',
      handle : '.serial-drag-handle',      
      cursor : 'move',
      helper : 'clone',
      revert : 50
    });
  }
  
});
