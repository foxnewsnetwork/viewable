require 'spec_helper'

describe Viewable do

  describe "api" do

    class ViewableTest; include Viewable; end

    describe "class" do
      let(:api) { ViewableTest }

      [:setup_renderer].each do |static|
        it "should respond to the #{static} method" do
          api.should respond_to static
        end
      end

      describe "#setup_renderer" do

        it "should have a default renderer" do
          api.renderer.should eq Viewable::Renderer
        end

      end

    end

    describe "instance" do
      let(:api) { ViewableTest.new }

      [:render].each do |dynamic|
        it "should respond to #{dynamic} method" do 
          api.should respond_to dynamic
        end

      end

      describe "#render" do

        it "should return a Viewable Context" do
          api.render.should be_a Viewable::Context
        end

      end

    end

  end

end  