require 'rails_helper'

RSpec.describe "favorited_brands#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/favorited_brands", params: params
  end

  describe 'basic fetch' do
    let!(:favorited_brand1) { create(:favorited_brand) }
    let!(:favorited_brand2) { create(:favorited_brand) }

    it 'works' do
      expect(FavoritedBrandResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['favorited_brands'])
      expect(d.map(&:id)).to match_array([favorited_brand1.id, favorited_brand2.id])
    end
  end
end
