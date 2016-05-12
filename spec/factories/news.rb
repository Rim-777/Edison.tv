FactoryGirl.define do
  factory :news do
    commentary 'Some news'
  end

  factory :invalid_news, class: 'News' do
    title nil
    user_id nil
  end
end
