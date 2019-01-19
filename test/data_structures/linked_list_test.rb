require "minitest/autorun"
require_relative "../../lib/data_structures/linked_list.rb"

# SESSION
# data_structures

describe LinkedList do
  let(:pairs) do
    { first: 1, second: 2, third: 3 }
  end

  let(:empty_list) do
    LinkedList.new
  end

  let(:list) do
    list = LinkedList.new
    pairs.each do |key, val|
      list.insert(key, val)
    end

    list
  end

  describe "#empty?" do
    it "checks whether any links have been inserted" do
      assert(empty_list.empty?)
      refute(list.empty?)
    end
  end

  describe "#insert" do 
    it "inserts nodes" do 
      empty_list.insert(:first, 1)
      refute(empty_list.empty?)
    end

    it "inserts links in order" do
      assert_equal(:first, list.first.key)
      assert_equal(:third, list.last.key)
    end
  end

  describe "#get" do
    it "gets by key" do
      assert_equal(1, list.get(:first))
      assert_equal(2, list.get(:second))
      assert_equal(3, list.get(:third))
    end

    it "returns nil for absent keys" do
      assert_nil(list.get(:absent_key))
    end
  end

  describe "#remove" do
    it "removes a node by key" do
      assert_equal(1, list.get(:first))
      list.remove(:first)
      assert_nil(list.get(:first))
    end

    it "reassigns pointers when links are removed" do
      list.remove(:second)

      assert_equal(:third, list.first.next.key)
      assert_equal(:first, list.last.prev.key)
    end
  end

  describe "#include?" do
    it "returns true if a key is present" do
      assert(list.include?(:first))
    end

    it "returns false if a key is not in the list" do
      refute(list.include?(:fourth))
    end
  end

  describe "#each" do
    it "enumerates over the links and yields each successive link" do
      yielded = []
      list.each { |link| yielded << link.value }
      assert_equal(pairs.values, yielded)
    end

  describe "#[]" do
    it "can look up links by index" do
      assert_equal(:first,  list[0].key)
      assert_equal(:second, list[1].key)
      assert_equal(:third,  list[2].key)
    end
  end

    it "includes Enumerable module" do
      assert_includes(list.class.ancestors, Enumerable)
    end
  end
end
