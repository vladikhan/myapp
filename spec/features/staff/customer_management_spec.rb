require "rails_helper"

RSpec.describe "職員による顧客管理", type: :system do
  include FeaturesSpecHelper

  let(:staff) { create(:staff_member) }
  let(:customer) { create(:customer, :with_home_address, :with_work_address) }

  before do
    # Для rack_test не нужен JS, используем стандартный драйвер
    driven_by :rack_test
    login_as_staff_member(staff)
    visit staff_customers_path
  end

  scenario "職員が顧客、自宅住所、勤務先を追加する" do
    # Кликаем по ссылке "新規登録"
    click_link "新規登録"

    # Заполняем форму
    fill_in "氏名", with: "山田 太郎"
    fill_in "メールアドレス", with: "taro@example.com"
    fill_in "生年月日", with: "1990-01-01"
    fill_in "郵便番号", with: "1234567"
    fill_in "都道府県", with: "東京都"
    fill_in "市区町村", with: "新宿区"
    fill_in "町名・番地", with: "西新宿1-1-1"
    fill_in "会社名", with: "テスト株式会社"

    # Переходим на экран подтверждения и сохраняем
    click_button "確認画面へ進む"
    click_button "更新"

    # Проверяем, что данные сохранились
    customer = Customer.last
    expect(customer.full_name).to eq("山田 太郎")
    expect(customer.home_address.postal_code).to eq("1234567")
    expect(customer.work_address.company_name).to eq("テスト株式会社")
  end

  scenario "職員が顧客情報を編集する" do
    # Создаем существующего клиента
    customer

    # Кликаем ссылку "編集" для первого клиента
    within("table.listing tbody tr:first-child") do
      click_link "編集"
    end

    # Меняем данные
    fill_in "氏名", with: "山田 次郎"
    fill_in "会社名", with: "更新株式会社"

    # Переходим на экран подтверждения и сохраняем
    click_button "確認画面へ進む"
    click_button "更新"

    customer.reload
    expect(customer.full_name).to eq("山田 次郎")
    expect(customer.work_address.company_name).to eq("更新株式会社")
  end
end