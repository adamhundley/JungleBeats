require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/list'

class ListTest < Minitest::Test
  def test_it_has_a_nil_head
    list = List.new
    assert_equal nil, list.head.data
  end

  def test_it_has_a_tail
    list = List.new("beep")
    assert_equal "beep", list.tail.data
  end

  def test_it_take_a_nil_tail
    list = List.new
    assert_equal nil, list.tail.link
  end

  def test_it_can_take_an_argument
    list = List.new("beep")
    assert_equal "beep", list.head.data
  end

  def test_it_can_take_multiple_beats
    list = List.new("beep boop bop")
    assert_equal "beep boop bop", list.head.data
  end

  def test_it_appends
    list = List.new("beep")
    list.append("boop")
    list.append("pop")
    list.append("dirp")
    assert_equal "dirp", list.tail.data
  end

  def test_it_prepends
    list = List.new("beep")
    list.prepend("sass")
    list.prepend("balls")
    assert_equal "balls", list.head.data
  end

  def test_it_counts
    list = List.new("beep")
    list.append("boop")
    list.append("pop")
    list.append("dirp")
    assert_equal 4, list.count
  end

  def test_it_returns_all
    list = List.new("beep")
    list.prepend("boop")
    list.prepend("pop")
    list.prepend("dirp")
    assert_equal "dirp pop boop beep", list.all
  end

  def test_it_can_include
    list = List.new("beep")
    list.append("boop")
    list.append("pop")
    list.append("dirp")
    assert list.include?("beep")
  end

  def test_it_can_insert
    list = List.new("beep")
    list.append("boop")
    list.append("pop")
    list.insert(2,"DEEP")
    assert_equal "beep boop DEEP pop", list.all
  end

  def test_it_can_find
    list = List.new("beep")
    list.append("boop")
    list.append("pop")
    list.append("dirp")
    assert_equal "pop dirp", list.find(2,2)
  end
  # def test_it_can_pop
  #   list = List.new("beep")
  #   list.append("boop")
  #   list.append("pop")
  #   assert_equal "pop", list.pop(1)
  # end


end
