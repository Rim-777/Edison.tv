FactoryGirl.define do
  factory :album do
    title 'some title'
  end

  factory :invalid_album, class: 'Album' do
    title nil
  end
end
