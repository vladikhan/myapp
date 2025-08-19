FactoryBot.define do
  factory :admin_member do
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