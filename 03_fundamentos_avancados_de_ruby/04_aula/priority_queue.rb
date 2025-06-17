class PriorityQueue
  attr_accessor :threads

  def initialize(priority: :default, threads_qtd: 3)
    @queue = Queue.new
    @priority = priority
    @threads_qtd = threads_qtd
    @threads = []

    build_thread_pool
  end

  def build_thread_pool
    @threads_qtd.times do 
      @threads << Thread.new do
        loop do; @queue.pop.call end
      end
    end
    
  end

  def schedule(&block)
    @queue << block
  end
end
