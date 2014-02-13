require 'pp'

class PeoplePrinter
  def initialize(collection)
    @collection = collection
  end

  def print
    @collection.each do |man|
      p man.to_s
    end
    p " ----------------- "
  end
end

class Person
  attr_accessor :preference_array, :name

  def initialize(name)
    @name = name
  end

  def to_s
    name + ": " + (preference_array.collect { |p| p.name }).join(", ")
  end
end

class Man < Person

end

class Woman < Person

end

men_names = ['Sam', 'Fred', 'Derick', 'James', 'Elon']
women_names = ['Bina', 'Merideth', 'Lauren', 'Jackie', 'Ally']

men = men_names.map do |name|
  Man.new(name)
end

women = women_names.map do |name|
  Woman.new(name)
end

men.each do |man|
  man.preference_array = women.shuffle
end

women.each do |woman|
  woman.preference_array = men.shuffle
end


men_printer = PeoplePrinter.new(men)
women_printer = PeoplePrinter.new(women)

men_printer.print
women_printer.print

men.each do |man|
  man.
end
