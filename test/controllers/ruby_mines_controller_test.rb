require 'test_helper'

class RubyMinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ruby_mine = ruby_mines(:one)
  end

  test "should get index" do
    get ruby_mines_url
    assert_response :success
  end

  test "should get new" do
    get new_ruby_mine_url
    assert_response :success
  end

  test "should create ruby_mine" do
    assert_difference('RubyMine.count') do
      post ruby_mines_url, params: { ruby_mine: { name: @ruby_mine.name, points: @ruby_mine.points } }
    end

    assert_redirected_to ruby_mine_url(RubyMine.last)
  end

  test "should show ruby_mine" do
    get ruby_mine_url(@ruby_mine)
    assert_response :success
  end

  test "should get edit" do
    get edit_ruby_mine_url(@ruby_mine)
    assert_response :success
  end

  test "should update ruby_mine" do
    patch ruby_mine_url(@ruby_mine), params: { ruby_mine: { name: @ruby_mine.name, points: @ruby_mine.points } }
    assert_redirected_to ruby_mine_url(@ruby_mine)
  end

  test "should destroy ruby_mine" do
    assert_difference('RubyMine.count', -1) do
      delete ruby_mine_url(@ruby_mine)
    end

    assert_redirected_to ruby_mines_url
  end
end
