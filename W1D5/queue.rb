require_relative 'stack'

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