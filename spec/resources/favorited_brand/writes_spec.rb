require "rails_helper"

RSpec.describe FavoritedBrandResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "favorited_brands",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FavoritedBrandResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { FavoritedBrand.count }.by(1)
    end
  end

  describe "updating" do
    let!(:favorited_brand) { create(:favorited_brand) }

    let(:payload) do
      {
        data: {
          id: favorited_brand.id.to_s,
          type: "favorited_brands",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FavoritedBrandResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { favorited_brand.reload.updated_at }
      # .and change { favorited_brand.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:favorited_brand) { create(:favorited_brand) }

    let(:instance) do
      FavoritedBrandResource.find(id: favorited_brand.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { FavoritedBrand.count }.by(-1)
    end
  end
end
