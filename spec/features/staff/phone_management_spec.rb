require "rails_helper"

feature "職員による顧客の電話番号管理", type: :feature do
  let!(:staff_member) { create(:staff_member, password: "password") }
  let!(:customer) { create(:customer) }

  def login_as_staff_member(staff_member)
    visit '/staff/login'
    expect(page).to have_content("ログイン")

    within("#login-form") do
      fill_in "メールアドレス", with: staff_member.email
      fill_in "パスワード", with: "password"
      click_button "ログイン"
    end

    expect(page).to have_content("ダッシュボード")
  end

  before do
    login_as_staff_member(staff_member)
  end

  
end