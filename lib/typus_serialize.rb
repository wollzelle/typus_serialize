require "typus_serialize/version"

module TypusSerialize
  if defined?(Rails)
    require 'typus_serialize/engine'
    require 'typus_serialize/helpers'
  end
end
