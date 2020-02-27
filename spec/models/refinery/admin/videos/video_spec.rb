require 'spec_helper'

module Refinery
  module Videos
    describe Video do

      describe 'validate file presence' do
        subject { FactoryGirl.build(:video) }
        before { subject.valid? }

        it { should be_invalid }
        it { expect(subject.errors).to include(:video_files) }
      end

      describe 'validate embed_tag presence' do
        subject { FactoryGirl.build(:video, :use_shared => true) }
        before { subject.valid? }

        it { should be_invalid }
        it { expect(subject.errors).to include(:embed_tag) }
      end

      describe 'should be valid' do
        subject { FactoryGirl.build(:valid_video) }
        it { should be_valid }
      end

      describe 'should be valid again' do
        let(:video_file) { FactoryGirl.build(:video_file) }
        let(:video) { FactoryGirl.build(:video, :use_shared => false) }
        before {video.video_files << video_file}
        it 'should be valid video' do
          video.should be_valid
        end
      end

      describe 'config' do
        let(:video) { FactoryGirl.build(:valid_video) }

        context 'get option' do
          before { video.config = { :height => 100 } }
          it 'should return config option' do
            video.height.should == video.config[:height]
          end
        end

        context 'set option' do
          before { video.config = { :height => 100 } }
          it 'should change config option' do
            expect { video.height = 200 }.to change { video.config[:height] }.from(100).to(200)
          end
        end

        context 'set default config when created' do
          let(:video) { Video.new }
          it 'should have config' do
            video.config.class.should == Hash
            video.config[:preload].should == 'true'
          end
        end

        context 'should save config' do
          let(:video) { Video.new(:use_shared => true, :embed_tag => 'video', :title => 'video') }
          it 'should save height' do
            video.config[:height] = 100
            video.save!
            video.config[:height].should == 100
          end
        end

      end

      describe 'video to_html method' do
        context 'with file' do
          let(:video_file) { FactoryGirl.build(:video_file) }
          let(:video) { Video.new(:use_shared => false) }
          before do
            video_file.stub(:remote_url) { 'url_to_video_file' }
            video.video_files << video_file
          end
          it 'should return video tag with source' do
            video.to_html.should match(/^<video.*<\/video>$/)
            video.to_html.should match(/<source src=["']url_to_video_file['"]/)
            video.to_html.should match(/data-setup/)
          end
        end

        context 'with embedded video' do
          let(:video) do
            FactoryGirl.create(:valid_video,
                               :embed_tag => "<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/L5J8cIQHlnY\" frameborder=\"0\" allowfullscreen></iframe>")
          end

          it 'should return video tag with iframe' do
            video.to_html.should match(/^<iframe.*<\/iframe>$/)
            video.to_html.should match(/www\.youtube\.com/)
            video.to_html.should match(/wmode=transparent/)
          end

          before do
            video.config[:height] = 111
            video.config[:width] = 222
          end

          it 'should set config from config before return tag' do
            video.to_html.should match(/222.*111/)
          end
        end
      end

      describe 'short_info' do
        let(:video) { FactoryGirl.build(:valid_video) }
        let(:video_file) { FactoryGirl.build(:video_file, :use_external => false) }
        it 'should return short info' do
          video.short_info.to_s.should match(/.shared_source/i)
          video.use_shared = false
          video.video_files << video_file
          video.short_info.to_s.should match(/.file/i)
        end
      end

    end
  end
end
