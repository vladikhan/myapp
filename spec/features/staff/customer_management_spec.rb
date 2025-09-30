# spec/features/staff/customer_management_spec.rb
require "rails_helper"

feature "職員による顧客管理", type: :feature do
  let(:staff_member) { create(:staff_member) }
  let(:customer) { create(:customer) }

  # Хелпер для логина, встроенный в тест
  def login_as_staff_member(staff_member)
    visit '/staff/login'
    expect(page).to have_content("ログイン")

    # ===================== ИСПРАВЛЕНИЕ ЗДЕСЬ =====================
    # Используем правильные ID полей, которые мы нашли в HTML
    fill_in "staff_login_form_email", with: staff_member.email
    fill_in "staff_login_form_password", with: staff_member.password
    # =============================================================

    # Уточняем, какую кнопку нажимать, чтобы избежать ошибки Ambiguous
    within("#login-form") do
      find('input[type="submit"][value="ログイン"]').click
    end
    
    # Проверяем, что после входа мы попали на дашборд
    expect(page).to have_content("ダッシュボード")
  end

  before do
    login_as_staff_member(staff_member)
  end

  
end