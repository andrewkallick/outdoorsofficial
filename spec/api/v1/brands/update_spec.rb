require "rails_helper"

RSpec.describe "brands#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/brands/#{brand.id}", payload
  end

  describe "basic update" do
    let!(:brand) { create(:brand) }

    let(:payload) do
      {
        data: {
          id: brand.id.to_s,
          type: "brands",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(BrandResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { brand.reload.attributes }
    end
  end
end
