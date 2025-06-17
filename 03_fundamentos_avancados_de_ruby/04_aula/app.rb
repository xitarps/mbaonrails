require_relative 'priority_queue'
require_relative 'dynamic_thread_pool'

pool = DynamicThreadPool.new(max_threads: 3)

10.times do |i|
  pool.schedule(:default) { sleep 1; puts "Tarefa padrão #{i} concluída" }
end

5.times do |i|
  pool.schedule(:high) { sleep 0.5; puts "Tarefa prioritária #{i} concluída" }
end

pool.shutdown # => termina a execução de todas as Threads
