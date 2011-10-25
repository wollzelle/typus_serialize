module Typus
  module Serialize
    if defined?(Rails)
      require 'jquery-rails'
      require 'rails-backbone'
      require 'eco'
      require 'serialize/engine'
      require 'serialize/helpers'
      require 'serialize/version'
    end
  end
end