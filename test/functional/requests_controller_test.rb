require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, request: { accommodation_id: @request.accommodation_id, departure_time_slots: @request.departure_time_slots, earliest_departure_time: @request.earliest_departure_time, latest_departure_time: @request.latest_departure_time, note: @request.note, resolution: @request.resolution, stay_duration: @request.stay_duration, stay_duration_margin: @request.stay_duration_margin, user_id: @request.user_id, venue_id: @request.venue_id }
    end

    assert_redirected_to request_path(assigns(:request))
  end

  test "should show request" do
    get :show, id: @request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request
    assert_response :success
  end

  test "should update request" do
    put :update, id: @request, request: { accommodation_id: @request.accommodation_id, departure_time_slots: @request.departure_time_slots, earliest_departure_time: @request.earliest_departure_time, latest_departure_time: @request.latest_departure_time, note: @request.note, resolution: @request.resolution, stay_duration: @request.stay_duration, stay_duration_margin: @request.stay_duration_margin, user_id: @request.user_id, venue_id: @request.venue_id }
    assert_redirected_to request_path(assigns(:request))
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id: @request
    end

    assert_redirected_to requests_path
  end
end
