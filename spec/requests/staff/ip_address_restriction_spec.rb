require "rails_helper"

describe "IPアドレスによるアクセス制限" do
  before do
    Rails.application.config.baukis2[:restrict_ip_addresses] = true
  end

  context "許可きょか" do
    it "allows access when IP is whitelisted" do
      AllowedSource.create!(namespace: "staff", ip_address: "127.0.0.1")

      get staff_root_path, headers: { "REMOTE_ADDR" => "127.0.0.1" }

      expect(response).to have_http_status(200)
    end
  end

  context "拒否きょひ" do
    it "denies access when IP is not whitelisted" do
      AllowedSource.create!(namespace: "staff", ip_address: "192.168.0.*")

      get staff_root_path, headers: { "REMOTE_ADDR" => "127.0.0.1" }

      expect(response).to have_http_status(403)
    end
  end
end