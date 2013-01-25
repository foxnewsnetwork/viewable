module Viewable
  class Context < IOMatic::Monadic::Context
    attr_accessor :collections, :metadata, :data

    def initialize(viewable=nil)
      super(viewable)

      @collections = []
      @metadata = []
      @data = []
    end

  end
end