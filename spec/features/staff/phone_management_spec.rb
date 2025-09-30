require "rails_helper"

feature "職員による顧客の電話番号管理" do
  include FeaturesSpecHelper
  let(:staff_member) { create(:staff_member) }
  let(:customer) { create(:customer) }

  before do
    switch_namespace(:staff)
    login_as_staff_member(staff_member)
  end

  scenario "職員が顧客の電話番号を追加する" do
  visit staff_customers_path
  
  # Более надежный способ найти конкретного клиента
  within("tr[data-customer-id='#{customer.id}']") do
    click_link "編集"
  end
  
  # Или используйте прямой путь
  visit edit_staff_customer_path(customer)

  fill_in "form_customer_phones_0_number", with: "090-9999-9999"
  check "form_customer_phones_0_primary"
  click_button "更新"

  customer.reload
  expect(customer.personal_phones.size).to eq(1)
  expect(customer.personal_phones[0].number).to eq("090-9999-9999")
end