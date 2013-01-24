module Viewable
  class Renderer

    def call(object)
      Viewable::Context.new object
    end

  end
end