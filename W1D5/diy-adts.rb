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

#   stack = Stack.new
#   stack.push(1)
#   stack.push(2)
#   p stack
#   stack.pop
#   p stack

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

#   queue = Queue.new
#   queue.enqueue(1)
#   queue.enqueue(2)
#   p queue
#   queue.dequeue
#   p queue
#   queue.peek
#   p queue

class Map
    def initialize
        @data = Array.new()
    end

    def set(key, value)
        exists = false
        @data.each do |subarr|
            if subarr[0] == key
                exists = true
                subarr[1] = value
            end
        end
        @data << [key, value] if !exists
    end

    def get(key)
        value = nil
        @data.each do |subarr|
            if subarr[0] == key
                value = subarr[1]
            end
        end
        value
    end

    def delete(key)
        @data.each do |subarr|
            if subarr[0] == key
                @data.delete(subarr)
            end
        end
    end

    def show
        p @data
    end
end

# map = Map.new()
# map.set("dog", "toshi")
# map.set("food", "pizza")
# map.set("bird", "sunshine")
# map.show
# map.delete("food")
# map.show