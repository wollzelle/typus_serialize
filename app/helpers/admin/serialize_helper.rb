module Admin::SerializeHelper
  
  class Serializer

    include ActionView::Helpers
    include ActiveModel::Naming

    ##
    # Class Methods
    #

    def self.assets_loaded?
      return true if @loaded
      @loaded = true
      return false
    end

    def self.load_assets
      yield unless self.assets_loaded?
    end

    ##
    # Instance Methods
    #

    def initialize(model, attribute)
      @model = model
      @attribute = attribute
    end

    def keys
      config = begin
        c = @model.class.typus_serialize_options[@attribute.to_sym][:keys]
        c.collect {|t| t.strip.humanize }.to_json
        rescue []
      end
      raw config
    end

    def name
      model = ActiveModel::Naming.param_key(@model) # => singular_model_name
      name = "#{model}[#{@attribute}]"
    end

    def data
      items = @model[@attribute].delete_if { |x| x == "" } rescue nil
      raw items.values.to_json rescue []
    end

    def locales
      locales = Typus::Translate::Configuration.config['locales'] rescue nil
      raw locales.keys.to_json rescue []
    end

    def limit
      limit = @model.class.typus_serialize_options[@attribute.to_sym][:limit] rescue []

      case limit
      when Range
        min = limit.first
        max = limit.last
      when Fixnum
        min = max = limit
      when Float
        min = max = limit.to_i
      else
        min = 0
        max = 1.0/0 # infinity
      end

      raw({ :min => min, :max => max }.to_json)
    end

  end

end