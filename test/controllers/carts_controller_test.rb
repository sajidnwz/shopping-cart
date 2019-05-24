require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carts_index_url
    assert_response :success
  end

  test "should get new" do
    get carts_new_url
    assert_response :success
  end

  test "should get show" do
    get carts_show_url
    assert_response :success
  end

  test "should get edit" do
    get carts_edit_url
    assert_response :success
  end

end
