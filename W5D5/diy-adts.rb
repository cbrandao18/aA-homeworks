  class Stack
    def initialize
      @data = []
    end

    def push(el)
      @data.push(el)
    end

    def pop
      @data.pop
    end

    def peek
      @data[-1]
    end
  end

  stack = Stack.new
  stack.push(1)
  stack.push(2)
  p stack
  stack.pop
  p stack

  class Queue
    def initialize
        @data = []
    end

    def enqueue(el)
        @data << el
    end

    def dequeue
        @data.shift
    end

    def peek
        @data[0]
    end
  end

  queue = Queue.new
  queue.enqueue(1)
  queue.enqueue(2)
  p queue
  queue.dequeue
  p queue
  queue.peek
  p queue