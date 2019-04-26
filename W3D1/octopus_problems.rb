##### Hungry Octopus #####

# Find the longest fish in O(n^2) time. 
# Do this by comparing all fish lengths to all other fish lengths
def sluggish_octopush(fishes)
    longest = ""
    i = 0
    j = 0
    while i < fishes.length
        while j < fishes.length
            if fishes[i].length > fishes[j].length
                longest = fishes[i]
            else
                longest = fishes[j]
            end
            j += 1
        end
        i += 1
        j = 0
    end
    return longest
end

class Array
    def merge_sort(&prc)
        prc ||= Proc.new { |x, y| x <=> y }

        return self if count <= 1

        midpoint = count / 2
        sorted_left = self.take(midpoint).merge_sort(&prc)
        sorted_right = self.drop(midpoint).merge_sort(&prc)

        Array.merge(sorted_left, sorted_right, &prc)
    end

    private
    def self.merge(left, right, &prc)
        merged = []

        until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1
            merged << left.shift
        when 0
            merged << left.shift
        when 1
            merged << right.shift
        end
        end

        merged.concat(left)
        merged.concat(right)

        merged
    end
end

# Find the longest fish in O(n log n) time. 
# Uses merge sort
def dominant_octopus(fishes)
    prc = Proc.new { |x, y| y.length <=> x.length }
    fishes.merge_sort(&prc)[0]
end

# Find the longest fish in O(n) time.
def clever_octopus(fishes)
    longest_fish = fishes.first
    fishes.each do |fish|
        if fish.length > longest_fish
            longest_fish = fish
        end
    end
    longest_fish
end

fishes = ['fish', 
'fiiish', 
'fiiiiish', 
'fiiiish', 
'fffish', 
'ffiiiiisshh', 
'fsh', 
'fiiiissshhhhhh']

##### Dancing Octopus #####
tiles_array = ["up", 
"right-up", 
"right", 
"right-down", 
"down", 
"left-down", 
"left", 
"left-up" ]

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def slow_dance(dir, tiles_array)
    tiles_array.each_with_index do |tile, index|
        return index if tile == direction
    end
end

def constant_dance(dir, tiles_hash)
    tiles_hash[dir]
end
