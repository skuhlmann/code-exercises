gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require_relative '../lib/tree'

describe Record do
  it "has an id" do
    assert_equal 0, Record.new(0).id
  end

  it "can have a parent id" do
    assert_equal 2, Record.new(0, 2).parent_id
  end
end

describe Tree do
  it "can contain a record" do
    record = Record.new(0)
    tree = Tree.new
    tree << record

    assert_equal 1, tree.collection.count
    assert_equal nil, tree.collection[0]
    assert_equal [0], tree.collection.keys
  end

  it "can contain many records" do
    records = [Record.new(0), Record.new(1), Record.new(3)]
    tree = Tree.new
    records.each { |record| tree << record }

    assert_equal 3, tree.collection.count
    assert_equal [0,1,3], tree.collection.keys
  end

  it "can provide the parent id of a record" do
    record = Record.new(0)
    child = Record.new(1, 0)
    tree = Tree.new
    tree << record
    tree << child

    assert_equal [0], tree.parents(child.id)
  end

  it "can provide all of the parent ids of a record" do
    record = Record.new(0)
    child = Record.new(1, 0)
    grandchild = Record.new(2, 1)

    tree = Tree.new
    tree << record
    tree << child
    tree << grandchild

    assert_equal [1,0], tree.parents(grandchild.id)
  end

  it "can provide a ton of parent ids of a record" do
    records = [Record.new(0), Record.new(1,0), Record.new(2,1),
               Record.new(3,2), Record.new(4,3), Record.new(5,4),
               Record.new(6,5), Record.new(7,6), Record.new(8,7)]
    tree = Tree.new
    records.each { |record| tree << record }

    assert_equal [0,1,2,3,4,5,6,7], tree.parents(8).sort
  end

  it "can provide a list of a records children" do
    records = [Record.new(0), Record.new(1,0), Record.new(2,1),
               Record.new(3,2), Record.new(4,3), Record.new(5,4),
               Record.new(6,5), Record.new(7,6), Record.new(8,7)]
    tree = Tree.new
    records.each { |record| tree << record }

    assert_equal [8], tree.children(7)
    assert_equal [1,2,3,4,5,6,7,8], tree.children(0)
  end
end
