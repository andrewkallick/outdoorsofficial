require 'rails_helper'

RSpec.describe BrandResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'brands',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BrandResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Brand.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:brand) { create(:brand) }

    let(:payload) do
      {
        data: {
          id: brand.id.to_s,
          type: 'brands',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BrandResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { brand.reload.updated_at }
      # .and change { brand.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:brand) { create(:brand) }

    let(:instance) do
      BrandResource.find(id: brand.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Brand.count }.by(-1)
    end
  end
end
