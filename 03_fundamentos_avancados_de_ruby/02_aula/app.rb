require_relative 'vector2'
require_relative 'monkey_patch/numerics_vector'

v = Vector2.new(3, 4)
puts v * 2 # Output: (6, 8)
puts v * 2.5 # Output: (7.5, 10.0)
puts v * v # Output: 25 (dot product)
puts 2 * v # Output: (6, 8)
puts 2.5 * v # Output: (7.5, 10.0)


require_relative 'html_builder'

builder = HtmlBuilder.new do
  div do
    div "Conteúdo em div"
    span "Nota em div"
  end
  span "Nota de rodapé"
end

puts builder.result # <div><div>Conteúdo em div</div><span>Nota em div</span></div><span>Nota de rodapé</span>