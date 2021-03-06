require "rails_helper"

RSpec.describe "brands#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/brands/#{brand.id}"
  end

  describe "basic destroy" do
    let!(:brand) { create(:brand) }

    it "updates the resource" do
      expect(BrandResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Brand.count }.by(-1)
      expect { brand.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
