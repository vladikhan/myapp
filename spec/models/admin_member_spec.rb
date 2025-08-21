require "rails_helper"

RSpec.describe AdminMember do 
  describe "#password=" do 
  example "文字列を *えると、hashed_passwordは長さ6０の文字列になる" do 
    admin = AdminMember.new
    admin.password = "baukis"
    expect(admin.password_digest).to be_kind_of(String)
    expect(admin.password_digest.size).to eq(60)
  end

  example "nil をすると、password_digestは nil になる" do
    admin = AdminMember.new(password_digest: "x")
    admin.password = nil
    expect(admin.password_digest).to be_nil
  end
end
end