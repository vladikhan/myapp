require "rails_helper"

RSpec.describe "次回から自動ログインする", type: :request do
  let(:customer) { create(:customer) }

  example "チェックボックスをoffにした場合" do
    post customer_login_path, 
      params: {
        customer_login_form: {
          email: customer.email,
          password: "password",
          remember_me: "0"
        }
      } 

    expect(session[:customer_id]).to eq(customer.id)
    expect(cookies["customer_id"]).to be_nil
  end

  example "チェックボックスをonにした場合" do
    post customer_login_path,
      params: {
        customer_login_form: {
          email: customer.email,
          password: "password",
          remember_me: "1"
        }
      }

    expect(session[:customer_id]).to be_nil
    expect(cookies.signed[:customer_id]).to eq(customer.id)
  end
end