module Admin::SerializeHelper
  
  class Serializer

    include ActionView::Helpers
    include ActiveModel::Naming

    ##
    # Instance Methods
    #

    def initialize(model = nil, attribute = nil)
      @model = model
      @attribute = attribute
    end

    def assets_loaded?
      return true if @loaded
      @loaded = true
      return false
    end

    def load_assets
      yield unless self.assets_loaded?
    end

    def keys
      keys = @model.class.typus_serialize_options[@attribute.to_sym][:keys]
      return raw keys.to_json
    end

    def name
      if translatable?
        translator = Admin::TranslateHelper::Translator
        names = {}
        forms = translator.forms # TODO: make sure the translation exists before!
        forms.each do |form|
          locale, builder = form
          names[locale] = translator.field_name_for(builder, @attribute)
        end
        return raw names.to_json
      else 
        model = ActiveModel::Naming.param_key(@model) # => singular_model_name
        name = "#{model}[#{@attribute}]"
        return raw name.to_json
      end
    end

    def data
      if translatable?
        items = []
        # get one translated attribute for the keys
        sample = @model.send(@attribute) || []
        sample.each do |item|
          # loop through the keys to build the reversed array 
          item.keys.each do |key|
            locales.each do |locale, trans|
              # get the data for this locale
              if data = @model.send(@attribute, locale)
                data.each_with_index do |d, idx|
                  item = items[idx] ||= {}
                  item[key] ||= {}
                  item[key][locale] = d[key] # inception
                end
              end
            end
          end
        end 
      else
        items = @model.send(@attribute)
      end
      return raw items.to_json
    end

    def translatable?
      @model.respond_to?('translations_attributes=') && @model.translated_attribute_names.include?(@attribute.to_sym)
    end

    def locales
      Typus::Translate::Configuration.config['locales'] if translatable?
    end

    def locales_json
      if translatable?
        raw locales.keys.to_json
      else
        raw [].to_json
      end
    end

    def limit
      limit = @model.class.typus_serialize_options[@attribute.to_sym][:limit]

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

      return raw({ :min => min, :max => max }.to_json)
    end

  end

end