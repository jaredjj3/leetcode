require "minitest/autorun"

def foo
end

describe "#foo" do
  it "always returns nil" do
    assert_nil(foo)
  end
end
