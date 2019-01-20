require "minitest/autorun"
require_relative "../../lib/1/trap_rain_water.rb"

# SESSION
# 1

describe "#trap_rain_water" do
  it "solves the problem prompt" do
    assert_equal(6 ,trap_rain_water([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
  end
end
