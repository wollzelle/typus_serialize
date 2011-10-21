module Typus
  module Serialize
    class Engine < Rails::Engine
      def initialize
        ActionView::Base.send(:include, Typus::Serialize::ApplicationHelper)
      end
    end
  end
end