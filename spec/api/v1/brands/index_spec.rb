require 'rails_helper'

RSpec.describe "brands#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/brands", params: params
  end

  describe 'basic fetch' do
    let!(:brand1) { create(:brand) }
    let!(:brand2) { create(:brand) }

    it 'works' do
      expect(BrandResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['brands'])
      expect(d.map(&:id)).to match_array([brand1.id, brand2.id])
    end
  end
end
