require 'test_helper'

class MusicControllerTest < ActionController::TestCase

  context "Music Controller" do
    setup do
      @musics = FactoryGirl.create(:music)
      @featured_musics = FactoryGirl.create(:music, featured: true)
    end

    context "#index" do
      should "check basic index action response" do
        get :index

        assert_response :success
        assert_not_nil assigns(:musics)
      end

      should "check for featured music records" do
        get :index

        assert_response :success
        assert_not_nil assigns(:musics)
      end
    end

    context "#music" do
      setup do
        @music = FactoryGirl.create(:music)
        @jpg_file_path = File.join( $fixtures_path, "what_lies_beneath.jpg" )
      end

      should "check basic response for music action" do
        get :music, title: @music.title

        assert_response :success
        assert_not_nil assigns(:music)
      end

      should "verify music action with attachments" do
        get :music, title: @music.title

        assert_response :success
        assert_not_nil assigns(:music)
      end
    end

  end
end
