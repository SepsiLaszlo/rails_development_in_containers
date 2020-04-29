require 'test_helper'

class VsCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vs_code = vs_codes(:one)
  end

  test "should get index" do
    get vs_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_vs_code_url
    assert_response :success
  end

  test "should create vs_code" do
    assert_difference('VsCode.count') do
      post vs_codes_url, params: { vs_code: { name: @vs_code.name, points: @vs_code.points } }
    end

    assert_redirected_to vs_code_url(VsCode.last)
  end

  test "should show vs_code" do
    get vs_code_url(@vs_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_vs_code_url(@vs_code)
    assert_response :success
  end

  test "should update vs_code" do
    patch vs_code_url(@vs_code), params: { vs_code: { name: @vs_code.name, points: @vs_code.points } }
    assert_redirected_to vs_code_url(@vs_code)
  end

  test "should destroy vs_code" do
    assert_difference('VsCode.count', -1) do
      delete vs_code_url(@vs_code)
    end

    assert_redirected_to vs_codes_url
  end
end
