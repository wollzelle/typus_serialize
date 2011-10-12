Typus.Serialize.Collections.Set = Backbone.Collection.extend({

  model: Typus.Serialize.Models.Item,
  
  initialize: function(models, options){
    this.baseName = options.baseName;
    this.keys = options.keys.split(', ');
  }
  
});