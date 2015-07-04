require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  context "Articles Controller" do
    setup do
      # @request    = ActionController::TestRequest.new
      role = FactoryGirl.create(:role)
      @user = FactoryGirl.create(:user)
      @user.roles << role
      @article = FactoryGirl.create(:article)
      # @response   = ActionController::TestResponse.new
      sign_in @user
    end

    should "get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:articles)
    end

    should "get new" do
      get :new
      assert_response :success
    end

    should "create article" do
      article = FactoryGirl.build(:article)
      post :create, :article => article.attributes
      assert_response :redirect
      assert_equal 'Article was successfully created.', flash[:notice]
    end

    should "show article" do
      get :show, id: @article
      assert_response :success
    end

    should "get edit" do
      get :edit, id: @article
      assert_response :success
    end

    should "update article" do
      put :update, id: @article, article: { content: @article.content, name: @article.name }
      assert_redirected_to articles_path
    end

    should "destroy article" do
      assert_difference('Article.count', -1) do
        delete :destroy, id: @article
      end

      assert_redirected_to articles_path
    end
  end
end
