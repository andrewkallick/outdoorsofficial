class Api::V1::BrandsController < Api::V1::GraphitiController
  def index
    brands = BrandResource.all(params)
    respond_with(brands)
  end

  def show
    brand = BrandResource.find(params)
    respond_with(brand)
  end

  def create
    brand = BrandResource.build(params)

    if brand.save
      render jsonapi: brand, status: 201
    else
      render jsonapi_errors: brand
    end
  end

  def update
    brand = BrandResource.find(params)

    if brand.update_attributes
      render jsonapi: brand
    else
      render jsonapi_errors: brand
    end
  end

  def destroy
    brand = BrandResource.find(params)

    if brand.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: brand
    end
  end
end
