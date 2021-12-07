require "rails_helper"

RSpec.describe FavoritedBrandResource, type: :resource do
  describe "serialization" do
    let!(:favorited_brand) { create(:favorited_brand) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(favorited_brand.id)
      expect(data.jsonapi_type).to eq("favorited_brands")
    end
  end

  describe "filtering" do
    let!(:favorited_brand1) { create(:favorited_brand) }
    let!(:favorited_brand2) { create(:favorited_brand) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: favorited_brand2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([favorited_brand2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:favorited_brand1) { create(:favorited_brand) }
      let!(:favorited_brand2) { create(:favorited_brand) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      favorited_brand1.id,
                                      favorited_brand2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      favorited_brand2.id,
                                      favorited_brand1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
