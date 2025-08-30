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



member = AdminMember.new(
  email: "sasha@example.com",
  family_name: "Sasha",
  given_name: "Ko",
  family_name_kana: "サシャ",
  given_name_kana: "コ",
  start_date: Date.today,
  end_date: Date.today.next_year,
  suspended: false
)

member.password = "password"   
member.save!   


member = StaffMember.new(
  email: "okamoto@example.com",
  family_name: "Okamoto",
  given_name: "Meiko",
  family_name_kana: "オカモト",
  given_name_kana: "メイコ",
  start_date: Date.today,
  end_date: Date.today.next_year,
  suspended: false
)

member.password = "password"   
member.save!         


member = StaffMember.new(
  email: "polina@example.com",
  family_name: "Tsoy",
  given_name: "Polina",
  family_name_kana: "ツォイ",
  given_name_kana: "ポリナ",
  start_date: Date.today,
  end_date: Date.today.next_year,
  suspended: false
)

member.password = "password"   
member.save!     



 member = StaffMember.new(
   email: "helena@example.com",
   family_name: "Hele",
   given_name: "Na",
   family_name_kana: "ヘレ",
   given_name_kana: "ナ",
   password: "foobar",  
   start_date: Date.today,
   end_date: Date.today.next_year,
   suspended: false
 )

 member.password = "password"   
 member.save!   



  member = StaffMember.new(
   email: "roza@example.com",
   family_name: "Roza",
   given_name: "Lee",
   family_name_kana: "ロザ",
   given_name_kana: "リー",
   password: "password",  
   start_date: Date.today,
   end_date: Date.today.next_year,
   suspended: false
 )

 member.password = "password"   
 member.save!   
