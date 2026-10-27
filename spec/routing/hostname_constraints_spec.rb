require 'rails_helper'

RSpec.describe "ホスト名による制約", type: :routing do
  let(:staff_host) { Rails.application.config.baukis2[:staff][:host] }
  let(:admin_host) { Rails.application.config.baukis2[:admin][:host] }

  it "staff host が正しい場合 routable" do
    expect(get: "http://#{staff_host}/staff/login").to be_routable
  end

 

  it "admin host が正しい場合 routable" do
    expect(get: "http://#{admin_host}/admin/login").to be_routable
  end


end
