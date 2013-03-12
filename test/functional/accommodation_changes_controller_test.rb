require 'test_helper'

class AccommodationChangesControllerTest < ActionController::TestCase
  setup do
    @accommodation_change = accommodation_changes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accommodation_changes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accommodation_change" do
    assert_difference('AccommodationChange.count') do
      post :create, accommodation_change: { field: @accommodation_change.field, new_value: @accommodation_change.new_value, old_value: @accommodation_change.old_value, user_id: @accommodation_change.user_id }
    end

    assert_redirected_to accommodation_change_path(assigns(:accommodation_change))
  end

  test "should show accommodation_change" do
    get :show, id: @accommodation_change
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accommodation_change
    assert_response :success
  end

  test "should update accommodation_change" do
    put :update, id: @accommodation_change, accommodation_change: { field: @accommodation_change.field, new_value: @accommodation_change.new_value, old_value: @accommodation_change.old_value, user_id: @accommodation_change.user_id }
    assert_redirected_to accommodation_change_path(assigns(:accommodation_change))
  end

  test "should destroy accommodation_change" do
    assert_difference('AccommodationChange.count', -1) do
      delete :destroy, id: @accommodation_change
    end

    assert_redirected_to accommodation_changes_path
  end
end
