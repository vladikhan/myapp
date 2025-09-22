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

  scenario "顧客が基本情報、自宅住所、勤務を更新する" do
    # Отмечаем чекбоксы, чтобы поля стали видимыми
    check "自宅住所を入力する"
    check "勤務先を入力する"

    # Заполняем основные поля
    fill_in "customer_birthday", with: "1980-04-01"
    fill_in "customer_home_address_postal_code", with: "999999"
    fill_in "customer_work_address_company_name", with: "テスト"

    click_button "確認画面へ進む"
    click_button "更新"

    # Проверяем, что данные обновились
    customer.reload
    expect(customer.birthday).to eq(Date.new(1980, 4, 1))
    expect(customer.home_address.postal_code).to eq("999999")
    expect(customer.work_address.company_name).to eq("テスト")
  end

  scenario "顧客が生年月日と自宅の郵便番号に無効な値を入力する" do
    check "自宅住所を入力する"

    fill_in "customer_birthday", with: "2100-01-01"
    fill_in "customer_home_address_postal_code", with: "XYZ"

    click_button "確認画面へ進む"

    # Проверяем, что поля выделены как ошибочные
    expect(page).to have_css("div.field_with_errors input#customer_birthday")
    expect(page).to have_css("div.field_with_errors input#customer_home_address_postal_code")
  end
end