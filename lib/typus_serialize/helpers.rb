module TypusSerialize
  module ApplicationHelper
    
    def get_keys(model, attribute)
      config = begin
          c = Typus::Configuration.config[model.class.to_s]['fields']['options']['serialize'][attribute.to_s]
          c.split(',').collect {|t| t.strip.humanize }.to_json
        rescue '[]'
        end
      raw config
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