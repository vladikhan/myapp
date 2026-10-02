require "rails_helper"

RSpec.describe StaffMember do 
  describe "#password=" do 
    it "文字列をセットするとpassword_digestは長さ60の文字列になる" do
      member = StaffMember.new
      member.password = "baukis"
      expect(member.password_digest).to be_kind_of(String)
      expect(member.password_digest.size).to eq(60)
    end

    it "nilをセットするとpassword_digestはnilになる" do
      member = StaffMember.new(password_digest: "x")
      member.password = nil
      expect(member.password_digest).to be_nil
    end
  end

  describe "値の正規化" do
    it "email前後の空白を除去" do
      member = create(:staff_member, email: " test@example.com ")
      expect(member.email).to eq("test@example.com")
    end

    it "emailに含まれる全角英数字を半角に変換" do
      member = create(:staff_member, email: "ＴＥＳＴ＠ＥＸＡＭＰＬＥ．ＣＯＭ")
      expect(member.email).to eq("test@example.com")
    end

    it "email前後の全角スペースを除去" do
      member = create(:staff_member, email: "\u{3000}test@example.com\u{3000}")
      expect(member.email).to eq("test@example.com")
    end

    it "family_name_kanaに含まれるひらがなをカタカナに変換" do
      member = create(:staff_member, family_name_kana: "てすと")
      expect(member.family_name_kana).to eq("テスト")
    end

    it "family_name_kanaに含まれる半角カタカナを全角カタカナに変換" do
      member = create(:staff_member, family_name_kana: "ﾃｽﾄ")
      expect(member.family_name_kana).to eq("テスト")
    end
  end
end
