module TypusSerialize
  module ApplicationHelper
    
    def get_keys(model, attribute)
      Typus::Configuration.config[model.class.to_s]['fields']['options']['serialize']['keys'][attribute.to_s]
    end
    
    def get_name(model, attribute)
      model = model.class.to_s.underscore
      name = "#{model}[#{attribute}]"
    end
    
    def get_json(model, attribute)
      items = model[attribute].delete_if { |x| x == "" } rescue nil
      raw items.values.to_json rescue []
    end
    
  end
end