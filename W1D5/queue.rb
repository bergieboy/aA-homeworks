class Queue

  def initialize
    @queue = [] # create ivar to store stack here!
  end

  def enqueue(el)
    @queue << el # adds an element to the stack
  end

  def dequeue
    @queue.shift # removes one element from the stack
  end

  def show
    @queue # return a copy of the stack
  end

end
