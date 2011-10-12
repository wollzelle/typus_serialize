Typus.Serialize.Models.Item = Backbone.Model.extend({
  
  initialize: function(attributes){
    var self = this;
    var keys = this.collection.keys;

    // create properties for each key 
    // but don't overwrite them if they already exist
    _.each(keys, function(key){
      if (!self.get(key)) {
        self.setByName(key, "");
      }
    });
  },

  baseName: function(){
    return this.collection.baseName + '[' + this.cid + ']';
  },
  
  setByName: function(key, value, options) { 
    var setter = {}; 
    setter[key] = value; 
    this.set(setter, options); 
  }

});