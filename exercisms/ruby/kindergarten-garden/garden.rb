class Garden

  attr_reader :plant_names, :diagram, :alphabet

  def initialize(diagram)
    @diagram = diagram
    @plant_names = {"V" => :violets, "R" => :radishes, "G" => :grass, "C" => :clover}
    @alphabet = ("A".."Z").to_a
  end

  def parse_diagram(name)
    diagram.split(/\n/).map  do |row|
      row[alphabet.index(name[0]) + 1]
    end
  end

  def alice
    parse_diagram("ALICE").join.chars.map { |letter| plant_names[letter] }
  end

  def bob
    parse_diagram("BOB").chars.join.map { |letter| plant_names[letter] }
  end

end
