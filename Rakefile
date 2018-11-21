require "yaml"

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

task :sync_index do
  index = YAML.load(File.read("index.yaml"))
  
  index.fetch("methods").each do |method_name|
    path = File.join("lib", "#{method_name}.rb")
    next if File.exists?(path)
    File.open(path, "w") { |file| file.write(skeleton(method_name)) }
  end
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