puts "Seeding customers..."

# Удаляем старые записи
Customer.destroy_all

city_names = %w(青巻市 赤巻市 黄巻市)
prefectures = Address::PREFECTURE_NAMES # предполагаем, что у тебя есть константа с префектурами
company_names = %w(OIAX ABC XYZ)

family_names = %w{
  佐藤:サトウ:sato
  鈴木:スズキ:suzuki
  高橋:タカハシ:takahashi
  田中:タナカ:tanaka
  渡辺:ワタナベ:watanabe
  伊藤:イトウ:ito
  山本:ヤマモト:yamamoto
  中村:ナカムラ:nakamura
  小林:コバヤシ:kobayashi
  加藤:カトウ:kato
}

given_names = %w{
  一郎:イチロウ:ichiro
  二郎:ジロウ:jiro
  三郎:サブロウ:saburo
  四郎:シロウ:shiro
  五郎:ゴロウ:goro
  松子:マツコ:matsuko
  竹子:タケコ:takeko
  梅子:ウメコ:umeko
  鶴子:ツルコ:tsuruko
  亀子:カメコ:kameko
}

10.times do |n|
  10.times do |m|
    fn = family_names[n % family_names.size].split(":")
    gn = given_names[m % given_names.size].split(":")

    c = Customer.create!(
      email: "#{fn[2]}.#{gn[2]}@example.jp",
      family_name: fn[0],
      given_name: gn[0],
      family_name_kana: fn[1],
      given_name_kana: gn[1],
      password: "password",
      birthday: rand(20..60).years.ago.to_date,
      gender: m < 5 ? "male" : "female"
    )

    # Личные телефоны
    c.personal_phones.create!(number: sprintf("090-0000-%04d", n * 10 + m)) if m.even?
    c.personal_phones.create!(number: sprintf("03-0000-%04d", n)) if m % 10 == 0

    # Домашний адрес
    c.create_home_address!(
      postal_code: sprintf("%07d", rand(10000000)),
      prefecture: prefectures.sample,
      city: city_names.sample,
      address1: "開発1-2-3",
      address2: "レイルズハイツ301号室"
    )

    # Рабочий адрес
    c.create_work_address!(
      postal_code: sprintf("%07d", rand(10000000)),
      prefecture: prefectures.sample,
      city: city_names.sample,
      address1: "試験4-5-6",
      address2: "ルビービル2F",
      company_name: company_names.sample,
      division_name: "営業部"
    )
  end
end

puts "Created #{Customer.count} customers"


puts "Creating staff_members..."

def debug_create_staff(attrs)
  StaffMember.create!(attrs)
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to create: #{attrs[:email]}"
  puts "   Errors: #{e.record.errors.full_messages.join(', ')}"
end

debug_create_staff(
  email: "taro@example.com",
  family_name: "山田",
  given_name: "太郎",
  family_name_kana: "ヤマダ",
  given_name_kana: "タロウ",
  password: "password",
  start_date: Date.today,
  end_date: Date.today + 365,
)

family_names = %w{
  佐藤:サトウ:sato
  鈴木:スズキ:suzuki
  高橋:タカハシ:takahashi
  田中:タナカ:tanaka
}

given_names = %w{
  二郎:ジロウ:jiro
  三郎:サブロウ:saburo
  マツコ:マツコ:matsuko
  武子:タケコ:takeko
  梅子:ウメコ:umeko
}

20.times do |n|
  fn = family_names[n % 4].split(":")
  gn = given_names[n % 5].split(":")

  debug_create_staff(
    email: "#{fn[2]}.#{gn[2]}@example.com",
    family_name: fn[0],
    given_name: gn[0],
    family_name_kana: fn[1],
    given_name_kana: gn[1],
    password: "password",
    start_date: (100 - n).days.ago.to_date,
    end_date: n == 0 ? Date.today : nil,
    suspended: n == 1
  )
end
