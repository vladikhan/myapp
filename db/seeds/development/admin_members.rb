member = AdminMember.new(
  email: "hanako@example.com",
  family_name: "Hana",
  given_name: "Ko",
  family_name_kana: "ハナ",
  given_name_kana: "コ",
  start_date: Date.today,
  end_date: Date.today.next_year,
  suspended: false
)

member.password = "foobar"   
member.save!                 