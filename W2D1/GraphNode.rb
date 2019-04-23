require 'set'
require "byebug"

class GraphNode
    attr_accessor :value, :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end

    def add_neighbor(node)
        self.neighbors << node
    end

end

def bfs(starting_node, target_value)
    arr_q = [starting_node]
    visited = Set.new()
    #debugger
    until arr_q.empty?
        current_node = arr_q.shift
        if visited.include?(current_node)
            next
        else
            visited.add(current_node) 
            if current_node.value == target_value
                return current_node
            elsif current_node != target_value 
                arr_q += current_node.neighbors
            end
        end

    end
    return nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
p bfs(a, "b")
p bfs(a, "f")