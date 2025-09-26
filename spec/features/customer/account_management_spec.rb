require "rails_helper"

feature "顧客によるアカウント管理" do
  include FeaturesSpecHelper
  let(:customer) { create(:customer, :with_home_address, :with_work_address) }

  before do
    switch_namespace(:customer)
    login_as_customer(customer)
    click_link "アカウント"
    click_link "編集"
  end

  scenario "顧客が勤務先を更新する" do
    # フォームの勤務先入力を表示させる
    check "勤務先を入力する"

    # 勤務先情報を入力
    fill_in "customer_work_address_company_name", with: "テスト株式会社"
    fill_in "customer_work_address_department", with: "開発部"
    fill_in "customer_work_address_postal_code", with: "1112222"

    click_button "確認画面へ進む"
    click_button "更新"

    # データが更新されたことを確認
    customer.reload
    expect(customer.work_address.company_name).to eq("テスト株式会社")
    expect(customer.work_address.department).to eq("開発部")
    expect(customer.work_address.postal_code).to eq("1112222")
  end
end