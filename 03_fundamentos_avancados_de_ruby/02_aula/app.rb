require_relative 'vector2'
require_relative 'monkey_patch/numerics_vector'

v = Vector2.new(3, 4)
p (v * 2).vector # Output: (6, 8)
p (v * 2.5).vector # Output: (7.5, 10.0)
p (v * v) # Output: 25 (dot product)
p (2 * v).vector # Output: (6, 8)
p (2.5 * v).vector # Output: (7.5, 10.0)

puts "\n\nExtra tests with Vector:\n\n"
v2 = Vector2.new(3, 4, 5)
p (v2 * 5).vector               # 15, 20, 25
p (v2 * v2)                     # 50
p (v2 * v2 * v2).vector         # 150, 200, 250
p (v2 * v2 * v2 * 3).vector     # 450, 600, 750
p (v2 * v2 * v2 * 3 * v2)         # 1125000

require_relative 'html_builder'

builder = HtmlBuilder.new do
  div do
    div "Conteúdo em div"
    span "Nota em div"
  end
  span "Nota de rodapé"
end

puts "\n"
puts builder.result # <div><div>Conteúdo em div</div><span>Nota em div</span></div><span>Nota de rodapé</span>