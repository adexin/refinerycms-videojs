
FactoryGirl.define do
  factory :video_file, :class => Refinery::Videos::VideoFile do
    sequence(:file_name) { |n| "refinery_#{n}.flv" }
    file_size 4793465
    file_ext nil
    file_uid "2012/04/07/21_10_55_485__i_i_.flv"
    file_mime_type "video/x-flv"
    external_url nil
    use_external false
  end
end

