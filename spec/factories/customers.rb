FactoryBot.define do
  factory :customer do
    sequence(:email) { |n| "test#{n}@example.com" }
    family_name { "山田" }
    given_name { "太郎" }
    family_name_kana { "ヤマダ" }
    given_name_kana { "タロウ" }
    password { "pw" }
    birthday { Date.new(1970, 1, 1) }
    gender { "male" }

    trait :with_home_address do
      after(:create) do |customer|
        create(:home_address, customer: customer)
      end
    end

    trait :with_work_address do
      after(:create) do |customer|
        create(:work_address, customer: customer)
      end
    end
  end
end