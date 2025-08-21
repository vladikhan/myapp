# spec/factories/admin_members.rb
FactoryBot.define do
  factory :administrator, class: 'AdminMember' do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password { "password" }           
    family_name { "山田" }
    given_name { "太郎" }
    family_name_kana { "ヤマダ" }
    given_name_kana { "タロウ" }
    start_date { Date.today }
    suspended { false }
  end
end