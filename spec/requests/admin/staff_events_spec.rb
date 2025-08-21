describe "Admin::StaffEvents", type: :request do
  before do
    host! 'baukis2.example.com'   
  end

  describe "GET /index" do
    it "returns success" do
      get admin_staff_events_url
      expect(response).to have_http_status(:ok)
    end
  end
end