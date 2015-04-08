class Record
  attr_reader :id, :parent_id

  def initialize(id, parent_id = nil)
    @id = id
    @parent_id = parent_id
  end
end

class Tree
  attr_accessor :collection

  def initialize
    @collection = {}
  end

  def <<(record)
    collection[record.id] = record.parent_id
  end

  def parents(record_id)
    parent_ids = []
    until root?(record_id)
      parent_ids << collection[record_id]
      record_id = parent_ids.last
      parents(record_id)
    end
    parent_ids
  end

  def root?(record_id)
    collection[record_id].nil?
  end

  def children(record_id)
    children_ids = []
    while with_child?(record_id)
      children_ids << collection.find { |record| record[1] == record_id }[0]
      record_id = children_ids.last
      children(record_id)
    end
    children_ids
  end

  def with_child?(record_id)
    collection.values.include?(record_id)
  end
end
