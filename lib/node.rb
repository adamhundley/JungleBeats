class Node
  attr_accessor :link  # => nil
  attr_reader :data    # => nil

  def initialize(data, link = nil)
    @data = data
    @link = link
  end
end
