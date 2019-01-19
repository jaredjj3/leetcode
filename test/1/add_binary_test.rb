require "minitest/autorun"
require_relative "../../lib/1/add_binary.rb"

# SESSION
# 1

describe "#add_binary" do
  def get_num
    rand(0..100)
  end

  it "adds binary numbers correctly" do
    100.times do
      num1 = get_num
      num2 = get_num
      sum = add_binary(num1.to_s(2), num2.to_s(2))
      assert_equal((num1 + num2).to_s(2), sum)
    end
  end
end
