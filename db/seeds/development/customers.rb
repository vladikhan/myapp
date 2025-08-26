puts "Seeding customers..."

# Удаляем старые записи, чтобы избежать конфликтов
Customer.destroy_all

# Создаём одного фиксированного пользователя
Customer.find_or_create_by!(email: "sato.ichiro@example.jp") do |c|
  c.family_name        = "佐藤"
  c.given_name         = "一郎"
  c.family_name_kana   = "サトウ"
  c.given_name_kana    = "イチロウ"
  c.gender             = "male"
  c.birthday           = "1968-11-17"
  c.password           = "password123"
end

# Создаём 10 тестовых пользователей с уникальными email
10.times do |i|
  Customer.find_or_create_by!(email: "testuser#{i}@example.jp") do |c|
    c.family_name        = "田中"
    c.given_name         = "太郎#{i}"
    c.family_name_kana   = "タナカ"
    c.given_name_kana    = "タロウ#{i}"
    c.gender             = ["male", "female"].sample
    c.birthday           = "1990-01-01"
    c.password           = "password123"
  end
end

puts "Customers seeded successfully!"