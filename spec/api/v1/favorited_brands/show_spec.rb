require 'rails_helper'

RSpec.describe "favorited_brands#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/favorited_brands/#{favorited_brand.id}", params: params
  end

  describe 'basic fetch' do
    let!(:favorited_brand) { create(:favorited_brand) }

    it 'works' do
      expect(FavoritedBrandResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('favorited_brands')
      expect(d.id).to eq(favorited_brand.id)
    end
  end
end
