Typus.Serialize.Collections.List = Backbone.Collection.extend({

  model: Typus.Serialize.Models.Item,
  
  initialize: function(models, options){
    this.baseName = options.baseName;
    this.keys = options.keys;
    this.min = options.limit.min || 0;
    this.max = options.limit.max || Infinity;
  },

  add: function(models, options){
    if (this.length < this.max)
      Backbone.Collection.prototype.add.call(this, models, options);
    else if (this.length >= this.max)
      this.trigger('limit:max', this);
  },

  remove: function(models, options){
    if (this.length > this.min)
      Backbone.Collection.prototype.remove.call(this, models, options);

    if (this.length <= this.min)
      this.trigger('limit:min', this);
  },

  reset: function(models, options){
    options || (options = {});

    // do not trigger reset yet, as we might add more models...
    Backbone.Collection.prototype.reset.call(this, models, { silent: true });

    if (this.length < this.min){
      // add more models
      var self = this;
      var count = this.min - this.length;
      _(count).times(function() {
        self.add(null, { silent: true });
      });
    }

    if (this.length >= this.max)
      this.trigger('limit:max', this);
    else if (this.length <= this.min)
      this.trigger('limit:min', this);

    // now lets trigger reset if we should...
    if (!options.silent) this.trigger('reset', this, options);
  }
});