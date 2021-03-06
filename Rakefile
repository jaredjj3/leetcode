require "yaml"
require "fileutils"

task :sync_index do
  index = YAML.load(File.read("index.yaml")) || {}
  raise "index must have unique session names" if index.keys.size != index.keys.uniq.size
  sync_dirs!(index.keys)
  sync_files!(index)
end

task :test, :paths do |t, args|
  paths = args.paths || [ENV.fetch("TEST")]

  paths.each do |path|
    session = File.dirname(path).split("/").last
    method = File.basename(path, ".rb")
    cmd = "ruby #{method.end_with?("_test") ? path : test_path(session, method)}"

    puts cmd
    pid = spawn(cmd)

    begin
      Timeout.timeout(ENV.fetch("TEST_TIMEOUT", 3)) do
        # puts "testing"
        Process.wait(pid)
        # puts "tests finished"
      end
    rescue Timeout::Error
      # puts "tests hanging"
      Process.kill("SIGINT", pid)
    end
  end
end

def lib_skeleton(session, method)
<<-RUBY.freeze
require_relative "#{File.join("..", "data_structures", "data_structures.rb")}"

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
require "minitest/autorun"
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

def sync_dirs!(sessions)
  created_dirs = create_session_dirs!(sessions)
  puts "created dirs: #{created_dirs * ", "}" if created_dirs.any?
  deleted_dirs = delete_extra_dirs!(sessions)
  puts "deleted dirs: #{deleted_dirs * ", "}" if deleted_dirs.any?
end

def create_session_dirs!(sessions)
  sessions.each.with_object([]) do |session, created|
    return [] if session.nil? || session.empty?

    lib_path = "lib/#{session}"
    test_path = "test/#{session}"

    unless Dir.exist?(lib_path)
      Dir.mkdir(lib_path)
      created << lib_path
    end

    unless Dir.exist?(test_path)
      Dir.mkdir(test_path)
      created << test_path
    end
  end
end

def delete_extra_dirs!(sessions)
  existing = Dir["lib/*"] + Dir["test/*"]
  expected = sessions.each.with_object([]) do |session, paths|
    paths << "lib/#{session}"
    paths << "test/#{session}"
  end

  dirs, files = (existing - expected).partition { |path| File.directory?(path) }
  files.each { |path| File.delete(path) }
  dirs.each { |path| FileUtils.rm_rf(path) }

  [*dirs, *files]
end

def sync_files!(session_mapping)
  session_mapping.each do |session, methods|
    created_files = create_session_files!(session, methods)
    puts "created files: #{created_files * ", "}" if created_files.any?
    deleted_files = delete_extra_files!(session, methods)
    puts "deleted files: #{deleted_files * ", "}" if deleted_files.any?
  end
end

def create_session_files!(session, methods)
  return [] if session.nil? || methods.nil? || session.empty?

  methods.each.with_object([]) do |method, created_files|
    next if method.nil? || method.empty?

    lib_path = lib_path(session, method)
    test_path = test_path(session, method)

    unless File.exist?(lib_path)
      File.open(lib_path, "w") { |file| file.write(lib_skeleton(session, method)) }
      created_files << lib_path
    end

    unless File.exist?(test_path)
      File.open(test_path, "w") { |file| file.write(test_skeleton(session, method)) }
      created_files << test_path
    end
  end
end

def delete_extra_files!(session, methods)
  return [] if session.nil? || methods.nil? || session.empty?
  existing = Dir["lib/#{session}/*"] + Dir["test/#{session}/*"]
  expected = methods.each.with_object([]) do |method, paths|
    paths << lib_path(session, method)
    paths << test_path(session, method)
  end

  deleted = existing - expected
  File.delete(*deleted)
  deleted
end
