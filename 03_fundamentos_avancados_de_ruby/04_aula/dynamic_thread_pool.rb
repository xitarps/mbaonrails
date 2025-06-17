class DynamicThreadPool
  def initialize(max_threads: 1)
    @max_threads = max_threads
    @queues = {}
  end

  def schedule(*args, &block)
    queue = @queues[args.first] ||= PriorityQueue.new(priority: args.first, threads_qtd: @max_threads)
    queue.schedule(&block)
  end

  def shutdown
    sleep 6 # in order to present response in the console
    @queues.each do |queue|
      queue.last.threads(&:join)
    end
  end
end
