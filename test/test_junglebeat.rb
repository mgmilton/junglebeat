gem 'minitest'
require './lib/junglebeat'
require 'minitest/autorun'
require 'minitest/pride'


class JungleBeatTest < Minitest::Test

  def test_list_is_initialized_with_new_junglebeat
    jb = JungleBeat.new
    assert_instance_of JungleBeat, jb
  end

  def test_append_returns_string
    jb = JungleBeat.new
    assert_equal "daa dum doo", jb.append("daa dum doo")
  end

  def test_count_returns_correct_length_of_list
    jb = JungleBeat.new
    jb.append("daa dee dom")
    assert_equal 3, jb.count
  end

  def test_play_generates_right_string
    jb = JungleBeat.new
    jb.append("daa dee dom")
    assert_equal "daa dee dom", jb.play
  end
end
