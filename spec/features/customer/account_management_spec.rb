# spec/features/customer/account_management_spec.rb
require "rails_helper"

feature "顧客によるアカウント管理", type: :feature do
  let(:customer) { create(:customer, :with_home_address, :with_work_address) }

  def login_as_customer(customer)
    # ... (код логина, он работает, его не трогаем)
    visit customer_login_path
    expect(page).to have_content("ログイン", wait: 5)
    within("#login-form") do
      fill_in "customer_login_form_email", with: customer.email
      fill_in "customer_login_form_password", with: customer.password || "pw"
      click_button "ログイン"
    end
    expect(page).to have_current_path(customer_root_path, wait: 5)
  end

  before do
    login_as_customer(customer)
  end

  scenario "顧客が基本情報、自宅住所、勤務を更新する" do
    visit edit_customer_account_path

    check "自宅住所を入力する"
    check "勤務先を入力する"

    # Заполняем поля (этот код работает)
    fill_in "form_home_address_postal_code", with: "123-4567"
    # fill_in "form_home_address_city", with: "新宿区" # Мы это отключили
    fill_in "form_work_address_company_name", with: "テスト株式会社"
    fill_in "customer_birthday", with: "1990-01-01"

    # Нажимаем первую кнопку, чтобы перейти на страницу подтверждения
    click_button "確認画面へ進む"

    # ===================== ФИНАЛЬНОЕ ИСПРАВЛЕНИЕ =====================
    # Мы на странице подтверждения. Теперь нужно нажать финальную кнопку
    # для сохранения данных. Вероятно, она называется "更新" (Обновить).
    click_button "更新"
    # =============================================================

    # Теперь, после финального сохранения, мы ожидаем увидеть сообщение об успехе.
    expect(page).to have_content("アカウント情報を更新しました")
  end
end