require "rails_helper"

RSpec.describe "favorited_brands#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/favorited_brands/#{favorited_brand.id}"
  end

  describe "basic destroy" do
    let!(:favorited_brand) { create(:favorited_brand) }

    it "updates the resource" do
      expect(FavoritedBrandResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { FavoritedBrand.count }.by(-1)
      expect { favorited_brand.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
