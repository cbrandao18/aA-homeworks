class LRUCache
    def initialize(size)
        @size = size
        @list = []
    end

    def count
        # returns number of elements currently in cache
        @list.count
    end

    def add(el)
        # adds element to cache according to LRU principle

        if @list.include?(el)
             #item is already in the list, remove it's instance and add it back
            @list.delete(el)
            @list << el
        elsif self.count >= @size
            #item isn't in the list but, we're at max size. 
            #remove the oldest item in the list and add new one
            @list.shift
            @list << el
        else
            @list << el
        end

    end

    def show
        # shows the items in the cache, with the LRU item first
        p @list
    end

end