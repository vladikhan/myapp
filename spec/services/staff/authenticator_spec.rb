# spec/services/staff/authenticator_spec.rb
require 'rails_helper'

RSpec.describe Staff::Authenticator, type: :service do
  let(:password) { "pw" }

  let(:active_member) do
    create(:staff_member, password: password, suspended: false)
  end

  let(:suspended_member) do
    create(:staff_member, password: password, suspended: true)
  end

  describe "#authenticate" do
    context "フラグが立っていれば true を返す" do
      it "активный сотрудник с правильным паролем" do
        auth = Staff::Authenticator.new(active_member)
        expect(auth.authenticate(password)).to be_truthy
      end
    end

    context "パスワードが間違っている場合" do
      it "false を返す" do
        auth = Staff::Authenticator.new(active_member)
        expect(auth.authenticate("wrong")).to be_falsey
      end
    end

    context "suspended フラグが立っている場合" do
      it "false を返す" do
        auth = Staff::Authenticator.new(suspended_member)
        expect(auth.authenticate(password)).to be_falsey
      end
    end
  end
end
