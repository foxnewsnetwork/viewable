require 'spec_helper'

describe Viewable::Context do

  describe "heritage" do
    subject { Viewable::Context.superclass }

    it { should eq IOMatic::Monadic::Context }
  end

  describe "api" do

    class ContextTest
      include Viewable
    end

    describe "dynamic" do
      before :each do
        c = Class.new
        c.any_instance.should_receive(:call).with(instance_of ContextTest).and_return(Viewable::Context.new ContextTest.new)
        ContextTest.setup_renderer c
      end

      let(:api) { ContextTest.new.render }

      describe "#collections" do
        let(:collections) { api.collections }

        it "should give me an array" do
          collections.should be_a Array
        end

        it "should give me an array of view contexts" do
          collections.each { |c| c.should be_a Viewable::Context }
        end

      end

      describe "#metadata" do
        let(:metadata) { api.metadata }

        it "should give me an array" do
          metadata.should be_a Array
        end

        it "should be such that each member of the metadata array can be stringified" do
          metadata.each do |m|
            m.should respond_to :to_s
            m.to_s.should be_a String
          end
        end
      end

      describe "#data" do
        let(:data) { api.data }

        it "should give me an array" do
          data.should be_a Array 
        end

        it "each member of the array must be convertible to a string" do
          data.each do |d|
            d.should respond_to :to_s
            d.to_s.should be_a String
          end
        end
      end

    end

  end

end