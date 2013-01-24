require File.join File.expand_path("../lib", File.dirname(__FILE__)), "viewable"


def require_all_spec_files_in(folder)
  Dir[File.join(File.dirname(__FILE__), folder, "*_spec.rb")].each { |source| require source }
end