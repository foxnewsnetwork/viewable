module Viewable
  module ClassMethods

    def setup_renderer(r)
      @_viewable_renderer = r
    end

    def renderer
      @_viewable_renderer
    end

    def self.extended(base)
      # Setting a default renderer
      if base.superclass.respond_to? :renderer
        # base.setup_renderer base.superclass.renderer
        # AFAIK, I don't think I will need this feature
      else
        base.setup_renderer Renderer
      end
    end

  end
end