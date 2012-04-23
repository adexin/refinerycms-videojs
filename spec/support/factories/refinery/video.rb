FactoryGirl.define do
  factory :video, :class => Refinery::Videos::Video do
    sequence(:title) { |n| "video_#{n}" }
    position nil
    config nil
    use_shared false
    embed_tag nil
  end
end


FactoryGirl.define do
  factory :valid_video, :class => Refinery::Videos::Video do
    sequence(:title) { |n| "video_#{n}" }
    position nil
    config nil
    use_shared true
    embed_tag '<iframe></iframe>'
  end
end

