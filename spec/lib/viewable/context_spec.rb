require 'spec_helper'

describe Viewable::Context do

  describe "heritage" do
    subject { Viewable::Context.superclass }

    it { should eq IOMatic::Monadic::Context }

  end

  describe "introspection" do
    subject { Viewable::Context }

    it { should be_include IOMatic::Dispatchable }
  end

  describe "api" do

    class ContextTest
      include Viewable
    end

    describe "dynamic" do

      let(:api) { ContextTest.new.render }

      describe "#dispatch" do
        
        it "should give me an instance" do
          api.should respond_to :dispatch
        end

        it "should return nil" do
          api.dispatch.should be_a Viewable::Context
        end

      end

      describe "#collections" do
        let(:collections) { api.collections }
        before :each do
          api.collections << Viewable::Context.new
        end
        it "should give me an array" do
          collections.should be_a Array
        end

        it "should give me an array of view contexts" do
          collections.each { |c| c.should be_a Viewable::Context }
        end

      end

      describe "#metadata" do
        let(:metadata) { api.metadata }
        before :each do
          api.metadata << "s"
        end

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

        before :each do
          api.data << "s"
        end
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