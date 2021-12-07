require 'rails_helper'

RSpec.describe "favorited_brands#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/favorited_brands/#{favorited_brand.id}", payload
  end

  describe 'basic update' do
    let!(:favorited_brand) { create(:favorited_brand) }

    let(:payload) do
      {
        data: {
          id: favorited_brand.id.to_s,
          type: 'favorited_brands',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FavoritedBrandResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { favorited_brand.reload.attributes }
    end
  end
end
