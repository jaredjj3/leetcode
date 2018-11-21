def skeleton(method_name)
<<-RUBY.freeze
require "minitest/autorun"
require "byebug"

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
  method_name = ENV.fetch("NAME")
  filename = "#{method_name}.rb"
  
  if File.exists?(filename)
    puts "'#{filename}' exists, continue? (y/n)"
    return unless STDIN.gets.chomp.downcase.to_sym == :y
  end

  File.open("#{method_name}.rb", "w") { |file| file.write(skeleton(method_name)) }
end

task :test, :paths do |t, args|
  if Array === args.paths
    args.paths.each do |path|
      cmd = "ruby #{path}"
      puts cmd
      system(cmd)
    end
  end
end