require 'spec_helper'

describe Viewable::ClassMethods do

  let(:klass) do 
    Class.new { include Viewable }
  end

  describe "inheritance" do
    let(:viewable) do 
      Class.new(klass)
    end

    describe "default" do
      it "should have the same renderer" do
        klass.renderer.should be_a Class
        klass.renderer.should eq Viewable::Renderer
        viewable.renderer.should be_nil
      end
    end

    describe "different" do
      before :each do
        @renderer = Class.new Viewable::Renderer
        viewable.setup_renderer @renderer 
      end

      it "should have the correct renderers" do
        viewable.renderer.should eq @renderer
        klass.renderer.should eq Viewable::Renderer
      end
    end

  end

end