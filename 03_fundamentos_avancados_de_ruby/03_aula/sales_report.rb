class SalesReport
  include Enumerable

  attr_reader :sales_avarage_amount

  def initialize(sales)
    @sales = sales
    @sales_avarage_amount = @sales.sum{ |sale| sale[:amount ] } / @sales.size
  end

  def each
    @sales.each { |sale| yield sale }
  end

  def total_by_category
    @sales.group_by { |sale| sale[:category] }
          .map do |key, collection|
            {category: key, total: collection.sum{|sale| sale[:amount]}}
          end
  end

  def top_sales(quantity)
    # My Original Answer:
    # @sales.sort { |saleA, saleB| saleB[:amount] <=> saleA[:amount] }
    #       .first(quantity)

    # My Second Answer:
    # * Just to play with lazy and considering it's already sorted before using lazy
    sales = @sales.sort{ |saleA, saleB| saleB[:amount] <=> saleA[:amount] }
    sales_limit = sales[quantity][:amount]
    sales.lazy
         .select { |sale| sale[:amount] > sales_limit }
         .to_a
  end

  def grouped_by_category
    @sales.group_by { |sale| sale[:category] }
  end

  def above_average_sales
    @sales.lazy
          .select {|sale| sale[:amount] > sales_avarage_amount}
          .to_a
  end
end
