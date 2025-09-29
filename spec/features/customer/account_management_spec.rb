require "rails_helper"

feature "顧客によるアカウント管理", type: :feature do
  let(:customer) { create(:customer, :with_work_address) }

  before do
    # Логинимся как customer через страницу входа
    visit customer_session_path

    fill_in "customer_login_form_email", with: customer.email
    fill_in "customer_login_form_password", with: "pw"
    click_button "ログイン"

    # Переходим на страницу редактирования аккаунта
    visit customer_account_path
    click_link "編集"
  end

  scenario "顧客が勤務先を更新する" do
    # Показываем форму для ввода данных о работе
    check "勤務先を入力する"

    fill_in "customer_work_address_company_name", with: "テスト株式会社"
    fill_in "customer_work_address_division_name", with: "開発部"
    fill_in "customer_work_address_postal_code", with: "1112222"

    click_button "確認画面へ進む"
    click_button "更新"

    expect(current_path).to eq(customer_account_path)

    customer.reload
    expect(customer.work_address.company_name).to eq("テスト株式会社")
    expect(customer.work_address.division_name).to eq("開発部")
    expect(customer.work_address.postal_code).to eq("1112222")
  end
end