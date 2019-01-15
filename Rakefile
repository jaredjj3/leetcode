require "yaml"

task :sync_index do
  # fetch method names from index.yaml
  index = YAML.load(File.read("index.yaml"))

  raise "index must have unique session names" if index.keys.size != index.keys.uniq.size

  index.each do |session, methods|
    created_files = create_session_files!(session, methods)
    puts "created files:\n#{created_files * "\n"}" if created_files.any?

    puts

    deleted_files = delete_extra_files!(session, methods)
    puts "deleted files:\n#{deleted_files * "\n"}" if deleted_files.any?
  end
end

task :test, :paths do |t, args|
  paths = args.paths || [ENV.fetch("TEST")]

  paths.each do |path|
    session = File.dirname(path)
    method = File.basename(path)
    cmd = "ruby #{test_path(session, method)}"
    system("cls")
    puts cmd
    system(cmd)
  end
end

def lib_skeleton(session, method)
<<-RUBY.freeze
require "minitest/autorun"

# SESSION
# #{session}

# PROMPT
=begin

=end

def #{method}
end
RUBY
end

def test_skeleton(session, method)
<<-RUBY.freeze
require_relative "#{File.join("..", "..", "lib", "#{session}", "#{method}.rb")}"

# SESSION
# #{session}

describe "##{method}" do
  it "solves the problem prompt" do
    flunk
  end
end
RUBY
end

def lib_path(session, method)
  File.join("lib", session, "#{method}.rb")
end

def test_path(session, method)
  File.join("test", session, "#{method}_test.rb")
end

def create_session_files!(session, methods)
  methods.each.with_object([]) do |method, created_files|
    lib_path = lib_path(session, method)
    test_path = test_path(session, method)

    unless File.exist?(lib_path)
      File.open(lib_path, "w") { |file| file.write(lib_skeleton(method)) }
      created_files << lib_path
    end

    unless File.exist?(test_path)
      File.open(test_path, "w") { |file| file.write(test_skeleton(method)) }
      created_files << test_path
    end
  end
end

def delete_extra_files!(session, methods)
  existing = Dir["lib/#{session}/*"] + Dir["test/#{session}/*"]
  expected = methods.each.with_object([]) do |method, paths|
    paths << lib_path(session, method)
    paths << test_path(session, method)
  end

  deleted = existing - expected
  File.delete(*deleted)
  deleted
end
