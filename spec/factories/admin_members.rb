# spec/factories/admin_members.rb
FactoryBot.define do
  factory :admin_member do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password { "pw" }
    family_name { "山田" }
    given_name { "太郎" }
    family_name_kana { "ヤマダ" }
    given_name_kana { "タロウ" }
    start_date { Date.today }
    suspended { false }
  end

  # Алиас для администратора
  factory :administrator, class: "AdminMember" do
    sequence(:email) { |n| "administrator#{n}@example.com" }
    password { "pw" }
    family_name { "山田" }
    given_name { "太郎" }
    family_name_kana { "ヤマダ" }
    given_name_kana { "タロウ" }
    start_date { Date.today }
    suspended { false }
  end

    factory :admin, class: "AdminMember" do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password { "pw" }
    family_name { "山田" }
    given_name { "太郎" }
    family_name_kana { "ヤマダ" }
    given_name_kana { "タロウ" }
    start_date { Date.today }
    suspended { false }
  end
end