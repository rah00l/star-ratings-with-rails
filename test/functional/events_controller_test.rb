require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = FactoryGirl.create(:event)
  end

  should "get index" do
    get :index

    assert_response :success
    assert_not_nil assigns(:events)
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create event" do
  #   assert_difference('Event.count') do
  #     post :create, event: { description: @event.description, ends_at: @event.ends_at, name: @event.name, starts_at: @event.starts_at }
  #   end

  #   assert_redirected_to event_path(assigns(:event))
  # end

  should "show event" do
    get :show, id: @event

    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @event
  #   assert_response :success
  # end

  # test "should update event" do
  #   put :update, id: @event, event: { description: @event.description, ends_at: @event.ends_at, name: @event.name, starts_at: @event.starts_at }
  #   assert_redirected_to event_path(assigns(:event))
  # end

  # test "should destroy event" do
  #   assert_difference('Event.count', -1) do
  #     delete :destroy, id: @event
  #   end

  #   assert_redirected_to events_path
  # end
end
