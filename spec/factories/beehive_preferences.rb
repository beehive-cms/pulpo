FactoryBot.define do
  factory :beehive_preference, class: 'Beehive::Preference' do
    value { "MyText" }
    key { "MyString" }
  end
end
