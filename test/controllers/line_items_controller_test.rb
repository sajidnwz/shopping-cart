require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get line_items_index_url
    assert_response :success
  end

  test "should get new" do
    get line_items_new_url
    assert_response :success
  end

  test "should get show" do
    get line_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get line_items_edit_url
    assert_response :success
  end

end
