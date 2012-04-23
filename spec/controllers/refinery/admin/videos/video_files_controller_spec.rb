require 'spec_helper'

describe Refinery::Videos::Admin::VideoFilesController do
  render_views
  before do
    @user = Refinery::User.create!(:username => 'admin@admin.com',
                                   :email => 'admin@admin.com',
                                   :password => 'admin@admin.com',
                                   :password_confirmation => 'admin@admin.com')
    @user.create_first
    sign_in @user
  end

  describe 'delete video file' do
    before do
      @video = FactoryGirl.build(:video, :use_shared => false)
      @video_file = FactoryGirl.create(:video_file, :external_url => 'url', :use_external => true)
      @video.video_files << @video_file
      @video.save!
    end

    it 'should delete video_file' do
      post :destroy, :id => @video_file.id
      response.status.should redirect_to(refinery.edit_videos_admin_video_path(@video))
      ::Refinery::Videos::VideoFile.count.should == 0
    end

  end

end
