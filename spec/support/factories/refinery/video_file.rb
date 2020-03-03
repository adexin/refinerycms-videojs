
FactoryGirl.define do
  factory :video_file, :class => Refinery::Videos::VideoFile do
    sequence(:file_name) { |n| "refinery_#{n}.flv" }
    file File.new(File.join(Rails.root, '../support/fixtures/video.flv'))
    external_url nil
    use_external false
  end
end

