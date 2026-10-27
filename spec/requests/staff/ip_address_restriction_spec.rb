require "rails_helper"

RSpec.describe "IPアドレスによるアクセス制限", type: :request do
  before do
    # Включаем проверку IP-адресов
    Rails.application.config.baukis2[:restrict_ip_addresses] = true
  end

  context "許可きょか" do
    it "allows access when IP is whitelisted" do
      AllowedSource.create!(namespace: "staff", ip_address: "127.0.0.1")

      get staff_root_path, headers: { "REMOTE_ADDR" => "127.0.0.1" }

      expect(response).to have_http_status(200)
    end
  end
end