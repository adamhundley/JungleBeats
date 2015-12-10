require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require_relative '../lib/jungle_beat'

class JungleBeatTest < Minitest::Test

  def test_takes_a_beat
    jb = JungleBeat.new("beep")
    assert_equal 1, jb.count
  end

  def test_it_lists_one_beat
    jb = JungleBeat.new("beep")
    assert_equal "beep", jb.all
  end

  def test_it_take_2_beats
    jb = JungleBeat.new("beep boop")
    assert_equal 2, jb.list.count
  end

  def test_it_lists_2_beats
    jb = JungleBeat.new("beep boop")
    assert_equal "beep boop", jb.all
  end

  def test_it_lists_one_beat_and_appends_one
    jb = JungleBeat.new("beep")
    jb.append("deep")
    assert_equal "beep deep", jb.all
  end

  def test_it_lists_one_beat_and_appends_two
    jb = JungleBeat.new("beep")
    jb.append("deep doop")
    assert_equal "beep deep doop", jb.all
  end

  def test_it_prepends
    jb = JungleBeat.new("beep beep boop boop doop doop")
    jb.prepend("TEST")
    assert_equal "TEST beep beep boop boop doop doop", jb.all
  end

  # def test_it_prepends_and_prints_count
  #
  #   jb = JungleBeat.new("beep beep boop boop")
  #   assert_equal 2, jb.prepend("doop doop")
  # end

  def test_it_taks_6_beats
    jb = JungleBeat.new("beep beep boop boop doop doop")
    assert_equal 6, jb.count
  end

  def test_it_includes_something
    jb = JungleBeat.new("beep deep doop boop loop poop")
    assert_equal true, jb.include?("poop")
  end

  def test_it_doesnt_include_something
    jb = JungleBeat.new("beep deep doop boop loop poop")
    refute jb.include?("jam")
  end


  def test_it_can_find
    jb = JungleBeat.new("beep deep doop boop loop poop")
    assert_equal "boop loop", jb.find(3,2)
  end

  # def test_it_can_insert
  #   jb = JungleBeat.new("beep deep doop boop loop poop")
  #   assert_equal "beep deep doop TEST boop loop poop", jb.insert(3,"TEST")
  # end

  def test_JB_can_pop_one
    jb = JungleBeat.new("beep deep doop boop loop poop")
    assert_equal "poop", jb.pop
  end

  def test_JB_can_pop_three
    jb = JungleBeat.new("beep deep doop boop loop poop")
    assert_equal "boop loop poop", jb.pop(3)
  end

  def test_JB_can_pop_three_and_drop
    jb = JungleBeat.new("beep deep doop boop loop poop")
    jb.pop(3)
    assert_equal "beep deep doop", jb.all
  end

  # def test_jb_can_pop_to_many
  #   jb = JungleBeat.new("beep deep doop")
  #   assert_equal "beep deep doop", jb.pop(3)
  # end


end
