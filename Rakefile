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
    flunk
  end
end
RUBY
end

task :sync_index do
  index = YAML.load(File.read("index.yaml"))

  lib = Dir["lib/*"].to_set
  path_by_method = index.fetch("methods").each.with_object({}) do |method, path_by_method|
    path_by_method[method] = File.join("lib", "#{method}.rb")
  end

  # create missing method files in lib
  path_by_method.each do |method, path|
    next if lib.include?(path) || method.nil?
    File.open(path, "w") { |file| file.write(skeleton(method)) }
    puts "created #{path}"
  end

  # destroy extra method files in lib
  (lib - path_by_method.values).each do |path|
    if File.exist?(path)
      File.delete(path)
      puts "deleted #{path}"
    end
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