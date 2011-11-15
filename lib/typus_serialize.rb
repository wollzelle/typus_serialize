module Typus
  module Serialize
    if defined?(Rails)
      require 'jquery-rails'
      require 'backbone-on-rails'
      require 'eco'
      require 'serialize/engine'
      require 'serialize/version'
    end
    
    if defined?(ActiveRecord)
      require 'serialize/class_methods'
      ActiveRecord::Base.extend(Typus::Serialize::ClassMethods)
    end
    
  end
end