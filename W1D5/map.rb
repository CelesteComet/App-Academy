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