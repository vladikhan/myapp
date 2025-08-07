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




# member = StaffMember.new(
#   email: "helena@example.com",
#   family_name: "Hele",
#   given_name: "Na",
#   family_name_kana: "ヘレ",
#   given_name_kana: "ナ",
#   password: "foobar",  
#   start_date: Date.today,
#   end_date: Date.today.next_year,
#   suspended: false
# )

# member.password = "foobar"   
# member.save!  