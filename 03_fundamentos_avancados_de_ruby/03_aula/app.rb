require_relative 'sales_report'

sales = [
  { product: "Notebook",  category: "Eletrônicos",  amount: 3000 },
  { product: "Celular",   category: "Eletrônicos",  amount: 1500 },
  { product: "Cadeira",   category: "Móveis",       amount: 500 },
  { product: "Mesa",      category: "Móveis",       amount: 1200 },
  { product: "Headphone", category: "Eletrônicos",  amount: 300 },
  { product: "Armário",   category: "Móveis",       amount: 800 }
]

sales_report = SalesReport.new(sales)

# 1. Incluir Enumerable e implementar #each para iterar
# sobre as vendas.
puts ('=' * 20) << " Implement .each " << ('=' * 20)
sales_report.each { |sale| puts "R$ #{sale[:amount]}" }

# 2. Um método #total_by_category que retorna um hash com
# o total de vendas por categoria.
puts ('=' * 20) << " Implement .total_by_category " << ('=' * 20)
puts sales_report.total_by_category # to_a para facilitar visualização no console

# 3. Um método #top_sales(n) que retorna os n maiores
# valores de venda
puts ('=' * 20) << " Implement .top_sales(n) " << ('=' * 20)
puts sales_report.top_sales(3)

# 4. Um método #grouped_by_category que retorna um hash
# com os produtos agrupados por categoria.
puts ('=' * 20) <<  " Implement .grouped_by_category "  << ('=' * 20)
puts sales_report.grouped_by_category.to_a # to_a para facilitar visualização no console

# 5. Um método #above_average_sales que retorna as vendas
# cujo valor está acima da média geral.
puts ('=' * 20) <<  "  Implement .above_average_sales "  << ('=' * 20)
p sales_report.above_average_sales
