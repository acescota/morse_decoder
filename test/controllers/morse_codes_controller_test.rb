require 'test_helper'

class MorseCodesControllerTest < ActionController::TestCase
  setup do
    @morse_code = morse_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:morse_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create morse_code" do
    assert_difference('MorseCode.count') do
      post :create, morse_code: { code: @morse_code.code, translation: @morse_code.translation }
    end

    assert_redirected_to morse_code_path(assigns(:morse_code))
  end

  test "should show morse_code" do
    get :show, id: @morse_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @morse_code
    assert_response :success
  end

  test "should update morse_code" do
    patch :update, id: @morse_code, morse_code: { code: @morse_code.code, translation: @morse_code.translation }
    assert_redirected_to morse_code_path(assigns(:morse_code))
  end

  test "should destroy morse_code" do
    assert_difference('MorseCode.count', -1) do
      delete :destroy, id: @morse_code
    end

    assert_redirected_to morse_codes_path
  end
end
