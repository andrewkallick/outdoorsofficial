require 'rails_helper'

RSpec.describe BrandResource, type: :resource do
  describe 'serialization' do
    let!(:brand) { create(:brand) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(brand.id)
      expect(data.jsonapi_type).to eq('brands')
    end
  end

  describe 'filtering' do
    let!(:brand1) { create(:brand) }
    let!(:brand2) { create(:brand) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: brand2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([brand2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:brand1) { create(:brand) }
      let!(:brand2) { create(:brand) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            brand1.id,
            brand2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            brand2.id,
            brand1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
