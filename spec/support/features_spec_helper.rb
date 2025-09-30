module FeaturesSpecHelper
  module FeaturesSpecHelper
  
    def login_as_staff_member(staff_member)
      visit staff_login_dev_path
      expect(page).to have_content("ログイン", wait: 5)
    
      fill_in "email", with: staff_member.email
      fill_in "password", with: staff_member.password || "password"
    
      click_button "ログイン"
    end
end

  # ... (метод login_as_staff_member остается без изменений) ...
end