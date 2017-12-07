gem 'minitest'
require './lib/linked_list'
require './lib/node'
require 'minitest/autorun'
require 'minitest/pride'

class LinkedListTest < Minitest::Test
  def test_head_initializes_with_nil
    list = LinkedList.new
    assert_nil list.head
  end

  def test_append_returns_data
    list = LinkedList.new
    assert_equal "doop", list.append("doop")
  end

  def test_append_adds_data_to_list
    list = LinkedList.new
    list.append("doop")
    assert_nil list.head.next_node
    assert_equal "doop", list.to_string
  end

  def test_count
    list = LinkedList.new
    list.append("doop")
    assert_equal 1, list.count
    list.append("boop")
    assert_equal 2, list.count
  end

  def test_to_string_returns_a_string
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    assert_equal "doop boop" ,list.to_string
  end

  def test_prepend_adds_data_to_beginnig
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.prepend("woop")
    assert_equal "woop doop boop", list.to_string
  end

  def test_insert_adds_data_at_num
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.prepend("woop")
    list.insert(2, "gawk")
    assert_equal "woop doop gawk boop", list.to_string

  end
  def test_insert_prepends_when_zero_is_given
    list = LinkedList.new
    list.append("doop")
    list.append("doop")
    list.append("doop")
    list.insert(0, "romp")
    assert_equal "romp doop doop doop", list.to_string
  end

  def test_insert_prevents_adding_beyond_length
    list = LinkedList.new
    list.append("doop")
    assert_equal "Number provided is longer than list!", list.insert(9, 'gawk')
  end

  def test_find_locates_correct_substring
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.append("woop")
    list.append("gawk")
    assert_equal "woop", list.find(2,1)
  end

  def test_find_prevent_negative_numbers
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.append("woop")
    assert_equal "ERROR!", list.find(-2,-2)
  end

  def test_includes_checks_list_for_existing_values
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.append("woop")
    refute list.includes("ramen")
    assert list.includes("woop")
  end

  def test_pop_removes_last_item_from_list
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.append("woop")
    list.pop
    assert_equal "doop boop", list.to_string
  end

  def test_pop_returns_last_item_from_list
    list = LinkedList.new
    list.append("doop")
    list.append("boop")
    list.append("woop")
    assert_equal "woop", list.pop
  end


end
