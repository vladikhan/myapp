require "rails_helper"

feature "顧客によるアカウント管理", type: :system do
  include FeaturesSpecHelper
  let(:customer) { create(:customer, :with_home_address, :with_work_address) }

  before do
    driven_by :rack_test
    switch_namespace(:customer)
    login_as_customer(customer)
  end

  scenario "顧客が基本情報、自宅住所、勤務を更新する" do
    visit edit_customer_account_path(customer)

    check "自宅住所を入力する" if page.has_unchecked_field?("自宅住所を入力する")
    check "勤務先を入力する" if page.has_unchecked_field?("勤務先を入力する")

    fill_in "customer_home_address_postal_code", with: "123-4567"
    fill_in "customer_home_address_city", with: "新宿区"
    fill_in "customer_work_address_company_name", with: "テスト株式会社"
    fill_in "customer_birth_date", with: "1990-01-01"

    click_button "更新"
    expect(page).to have_content("アカウント情報を更新しました")
  end
end
