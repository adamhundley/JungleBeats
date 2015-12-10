require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/node'

class NodeTest < Minitest::Test
  def test_a_thing
    assert_equal 1, 1
  end

  def test_it_takes_the_data
    n1 = Node.new("beep")
    assert_equal "beep", n1.data
  end

  def test_link_starts_at_nil
    n1 = Node.new("beep")
    assert_equal nil, n1.link
  end

  def test_link_can_be_assigned
    n1 = Node.new("beep")
    n2 = Node.new("boop", n1)
    assert_equal n1, n2.link
  end

  def test_data_can_pass_through_link
    n1 = Node.new("beep")
    n2 = Node.new("boop", n1)
    assert_equal "beep", n2.link.data
  end
  
  def test_link_can_be_found_through_inception
    n1 = Node.new("beep")
    n2 = Node.new("boop", n1)
    n3 = Node.new("pop", n2)
    assert_equal n1, n3.link.link
  end
end
