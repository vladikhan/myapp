require "rails_helper"

RSpec.describe AdminMember do 
  describe "#password=" do 
  example "文字列を *えると、hashed_passwordは長さ6０の文字列になる" do 
    admin = AdminMember.new
    admin.password = "baukis"
    expect(admin.hashed_password).to be_kind_of(String)
    expect(admin.hashed_password.size).to eq(60)
  end

  example "nil をすると、hashed_passwordは nil になる" do
    admin = AdminMember.new(hashed_password: "x")
    admin.password = nil
    expect(admin.hashed_password).to be_nil
  end
end
end