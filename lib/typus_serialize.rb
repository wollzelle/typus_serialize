module TypusSerialize

  if defined?(Rails)
    require 'jquery-rails'
    require 'rails-backbone'
    require 'ejs'
    require 'typus_serialize/engine'
    require 'typus_serialize/helpers'
    require 'typus_serialize/version'
  end

end