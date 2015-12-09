require 'minitest'              # => true
require 'minitest/pride'        # => true
require 'minitest/autorun'      # => true
require_relative '../lib/node'  # => true

class NodeTest < Minitest::Test
  def test_a_thing
    assert_equal 1, 1                           # => true
  end
  def test_it_takes_the_data
    n1 = Node.new("beep")                       # => #<Node:0x007fbda91c78e8 @data="beep", @link=nil>
    assert_equal "beep", n1.data                # => true
  end
  def test_link_starts_at_nil
    n1 = Node.new("beep")                       # => #<Node:0x007fbda91cc960 @data="beep", @link=nil>
    assert_equal nil, n1.link                   # => true
  end
  def test_link_can_be_assigned
    n1 = Node.new("beep")                       # => #<Node:0x007fbda91c5958 @data="beep", @link=nil>
    n2 = Node.new("boop", n1)                   # => #<Node:0x007fbda91c5778 @data="boop", @link=#<Node:0x007fbda91c5958 @data="beep", @link=nil>>
    assert_equal n1, n2.link                    # => true
  end
  def test_data_can_pass_through_link
    n1 = Node.new("beep")                       # => #<Node:0x007fbda91bca88 @data="beep", @link=nil>
    n2 = Node.new("boop", n1)                   # => #<Node:0x007fbda91bd6b8 @data="boop", @link=#<Node:0x007fbda91bca88 @data="beep", @link=nil>>
    assert_equal "beep", n2.link.data           # => true
  end
  def test_link_can_be_found_through_inception
    n1 = Node.new("beep")                       # => #<Node:0x007fbda91bdcd0 @data="beep", @link=nil>
    n2 = Node.new("boop", n1)                   # => #<Node:0x007fbda91bd988 @data="boop", @link=#<Node:0x007fbda91bdcd0 @data="beep", @link=nil>>
    n3 = Node.new("pop", n2)                    # => #<Node:0x007fbda91bd550 @data="pop", @link=#<Node:0x007fbda91bd988 @data="boop", @link=#<Node:0x007fbda91bdcd0 @data="beep", @link=nil>>>
    assert_equal n1, n3.link.link               # => true
  end
end



# >> Run options: --seed 14326
# >>
# >> # Running:
# >>
# >> [38;5;154m.[0m[38;5;154m.[0m[38;5;148m.[0m[38;5;184m.[0m[38;5;184m.[0m[38;5;214m.[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.001177s, 5097.7060 runs/s, 5097.7060 assertions/s.
# >>
# >> 6 runs, 6 assertions, 0 failures, 0 errors, 0 skips
