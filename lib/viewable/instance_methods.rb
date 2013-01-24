module Viewable
  module InstanceMethods

    def render
      self.class.renderer.new.call(self)
    end

  end
end