# spec/factories/staff_members.rb
FactoryBot.define do
  factory :staff_member do
    sequence(:email) { |n| "staff#{n}@example.com" }
    password { "pw" }                 
    family_name { "山田" }
    given_name { "太郎" }
    family_name_kana { "ヤマダ" }
    given_name_kana { "タロウ" }
    start_date { Date.today }
    end_date { nil }                  
    suspended { false }
  end
end