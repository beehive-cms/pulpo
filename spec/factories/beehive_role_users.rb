FactoryBot.define do
  factory :beehive_role_user, class: 'Beehive::RoleUser' do
    role { nil }
    user { nil }
  end
end
