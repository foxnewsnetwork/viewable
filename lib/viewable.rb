require "iomatic"
require "active_support/core_ext/string"
module Viewable
  [:ClassMethods, :InstanceMethods, :Context, :Renderer].each do |source|
    autoload source, File.join(File.dirname(__FILE__), "viewable", source.to_s.underscore)
  end

  def self.included(base)
    base.extend ClassMethods
    base.class_exec do
      include InstanceMethods
    end
  end

end