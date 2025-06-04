module VectorialNumeric
  def mult(value_or_vector)
    return self.send(:system_mul, value_or_vector) if value_or_vector.is_a? Numeric

    multiplied_by_vector(value_or_vector).to_s
  end

  alias :* :mult

  def multiplied_by_vector(value_or_vector)
    value_or_vector.vector.map{ |item| item * self }
  end
end

class Integer
  alias :system_mul :*

  prepend VectorialNumeric
end

class Float
  alias :system_mul :*

  prepend VectorialNumeric
end
