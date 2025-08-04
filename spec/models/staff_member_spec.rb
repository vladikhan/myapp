require "rails_helper"

RSpec.describe StaffMember do 
  describe "#password=" do 
  example "文字列を *えると、hashed_passwordは長さ6０の文字列になる" do 
    member = StaffMember.new
    member.password = "baukis"
    expect(member.hashed_password).to be_kind_of(String)
    expect(member.hashed_password.size).to eq(60)
  end

  example "nil をすると、hashed_passwordは nil になる" do
    member = StaffMember.new(hashed_password: "x")
    member.password = nil
    expect(member.hashed_password).to be_nil
  end
end
end