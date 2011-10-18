module TypusSerialize

  class Engine < Rails::Engine
    def initialize
      ActionView::Base.send(:include, TypusSerialize::ApplicationHelper)
    end
  end

end