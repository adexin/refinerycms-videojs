require 'spec_helper'

describe Refinery::Videos::Admin::VideosController, type: :controller do
  render_views

  before do
    @user = Refinery::Authentication::Devise::User.create!(:username => 'admin@admin.com',
                                   :email => 'admin@admin.com',
                                   :password => 'admin@admin.com',
                                   :password_confirmation => 'admin@admin.com')
    @user.create_first
    sign_in @user
  end

  describe 'insert video' do
    before do
      @video = FactoryGirl.create(:valid_video, :title => "TestVideo")
    end
    it 'should get videos html' do
      get :insert, params: { app_dialog: true, dialog: true }
      response.should be_success
      response.body.should match(/TestVideo/)
    end

    it 'should get preview' do
      get :dialog_preview, params: { id: "video_#{@video.id}" }, format: :js, xhr: true
      response.should be_success
      response.body.should match(/iframe/)
    end

    it 'should get preview' do
      post :append_to_wym, params: { video_id: @video.id, video: { height: 100 } }, format: :js
      response.should be_success
      response.body.should match(/iframe/)
    end

  end

end
