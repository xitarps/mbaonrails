class Vector2
  attr_accessor :vector

  def initialize(*vector)
    @vector = vector
  end

  def *(number)
    return vector_multiplied_by_number(number) if number.is_a? Numeric

    vector_multiplied_by_vector
  end

  def vector_multiplied_by_number(number)
    Vector2.new(*vector.map{ |item| item * number })
  end

  def vector_multiplied_by_vector
    combinations = vector.zip(vector)
    combinations.sum { |combination| combination.inject(1){|acc, i| acc * i} }
  end
end
