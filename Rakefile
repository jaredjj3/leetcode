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

def lib_path(method_name)
  File.join("lib", "#{method_name}.rb")
end

task :sync_index do
  # fetch method names from index.yaml
  index = YAML.load(File.read("index.yaml"))
  methods = index.fetch("methods")

  # create missing method files in lib dir
  methods.each do |method|
    path = lib_path(method)
    next if File.exist?(path) || method.nil?
    File.open(path, "w") { |file| file.write(skeleton(method)) }
    puts "created #{path}"
  end

  # destroy extra method files in lib dir
  (Dir["lib/*"] - methods.map(&method(:lib_path))).each do |path|
    if File.exist?(path)
      File.delete(path)
      puts "deleted #{path}"
    end
  end
end

task :test, :paths do |t, args|
  args.paths.each do |path|
    cmd = "ruby #{path}"
    puts cmd
    system(cmd)
  end
end