require "rails_helper"

RSpec.describe "brands#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/brands/#{brand.id}", params: params
  end

  describe "basic fetch" do
    let!(:brand) { create(:brand) }

    it "works" do
      expect(BrandResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("brands")
      expect(d.id).to eq(brand.id)
    end
  end
end
