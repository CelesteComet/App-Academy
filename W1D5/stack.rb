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