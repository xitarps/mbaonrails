module HtmlElement
  def insert_element(content = nil, tag = nil, &block)
    @html << "<#{tag}>"
    if block_given?
      instance_eval(&block)
    else
      @html << content
    end
    @html << "</#{tag}>"
  end
end

class HtmlBuilder
  include HtmlElement

  def initialize(&block)
    @html = ''
    instance_eval(&block) if block_given?
  end

  def div(content = nil, &block) = insert_element(content, tag = 'div', &block)

  def span(content = nil, &block) = insert_element(content, tag = 'span', &block)

  def result = @html
end
