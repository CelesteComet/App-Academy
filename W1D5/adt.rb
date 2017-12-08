class Stack
  def initialize
    @container = []
  end

  def add(el)
    @container.push(el)
  end

  def remove
    @container.pop
  end 

  def show
    @container
  end
end

class Queue
  def initialize
    @inbox = Stack.new 
    @outbox = Stack.new
  end

  def enqueue(el)
    @inbox.add(el)
  end

  def dequeue
    to_outbox 
    @outbox.remove
  end

  def show
    to_outbox 
    @outbox.show
  end

  private

  def to_outbox
    while @inbox.show.length > 0
      @outbox.add(@inbox.remove)
    end
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    found = false
    @map.each do |pair|
      if pair.first == key
        pair[1] = value
        found = true
      end
    end

    if !found 
      @map.push([key, value])
    end

    [key, value]
  end

  def lookup(key)
    @map.each do |pair|
      if pair.first == key
        return pair.last
      end
    end
    nil
  end

  def remove(key)
    i = 0
    while i < @map.length 
      if @map[i][0] == key
        @map[i] = nil
        i += 1
      end
    end
    @map.compact!
  end

  def show
    @map
  end

end

a = Map.new 
a.assign("Bruce", 12)
a.assign("Bruce", 15)
a.remove("Bruce")
print a.show