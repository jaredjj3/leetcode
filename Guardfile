# directories [Dir.pwd]

guard "rake", task: "test", run_on_start: false do
  watch(%r{^lib/*/.+.rb$})
  watch(%r{^test/*/.+.rb$})
end

guard "rake", task: "sync_index" do
  watch(%r{^index.yaml$})
end
