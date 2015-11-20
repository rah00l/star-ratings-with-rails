require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  context "UsersController" do
    setup do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    should "get edit" do
      get :edit, id: @user

      assert_response :success
    end

    context "#update_password" do
      should "able to update the current password" do
        put :update_password, id: @user, user: { current_password: '12345678', password: 'testuser123' }

        assert_redirected_to root_path
        assert_equal 'Password was successfully updated.', flash[:notice]
      end

      should "return user edit page" do
        put :update_password, id: @user, user: { }

        assert_response :success
        assert_not_nil assigns(:user)
      end
    end
  end
end
