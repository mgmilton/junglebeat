gem 'minitest'
require './lib/node'
require "minitest"
require "minitest/autorun"
require "minitest/pride"

class NodeTest < Minitest::Test
  def test_node_returns_data
    node = Node.new("plop")
    assert_equal "plop", node.data
  end

  def test_node_is_nil_by_default
    node = Node.new("boop")
    assert_nil node.next_node
  end
end
