require "open-uri"
require "nokogiri"

def skeleton(method_name)
<<-RUBY.freeze
require "minitest/autorun"

# PROMPT
=begin

=end

def #{method_name}
end

describe "##{method_name}" do
  it "solves the problem prompt" do

  end
end
RUBY
end

task :gen do
  method_name = ENV.fetch("METHOD_NAME")
  File.open("#{method_name}.rb", "w") { |file| file.write(skeleton(method_name)) }
end

task :test do
  method_name = ENV.fetch("METHOD_NAME")
  system("ruby #{method_name}.rb")
end