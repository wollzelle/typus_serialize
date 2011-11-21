module Typus
  module Serialize
    module ClassMethods
      @@typus_serialize_fields = []
      @@typus_serialize_options  = {}
      
      mattr_accessor :typus_serialize_options, :typus_serialize_fields

      def typus_serialize(*args)        
        options = args.extract_options!
        field = args[0]        
        self.typus_serialize_fields << field
        self.typus_serialize_options[field] = options
        serialize field
        translation_class.send :serialize, field if respond_to?(:translation_class)

        extend TemplateMethods unless extended_modules.include?(TemplateMethods)
      end
      
      def extended_modules
        (class << self; self end).included_modules        
      end      
    end
    
    module TemplateMethods
      def typus_template(attribute)
        if self.typus_serialize_fields.include? attribute.to_sym
          'serialize'
        else
          super(attribute)
        end
      end
      
    end
  end
end