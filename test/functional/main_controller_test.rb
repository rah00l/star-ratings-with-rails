require 'test_helper'

class MainControllerTest < ActionController::TestCase

  context "Main Controller" do
    setup do
      @photo = FactoryGirl.create(:photo)
    end

    should "get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:photo)
    end
  end
end
