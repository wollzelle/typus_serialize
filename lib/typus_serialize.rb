module Typus
  module Serialize
    if defined?(Rails)
      require 'jquery-rails'
      require 'backbone-on-rails'
      require 'eco'
      require 'serialize/engine'
      require 'serialize/version'
    end
  end
end