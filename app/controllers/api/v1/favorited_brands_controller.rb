class Api::V1::FavoritedBrandsController < Api::V1::GraphitiController
  def index
    favorited_brands = FavoritedBrandResource.all(params)
    respond_with(favorited_brands)
  end

  def show
    favorited_brand = FavoritedBrandResource.find(params)
    respond_with(favorited_brand)
  end

  def create
    favorited_brand = FavoritedBrandResource.build(params)

    if favorited_brand.save
      render jsonapi: favorited_brand, status: :created
    else
      render jsonapi_errors: favorited_brand
    end
  end

  def update
    favorited_brand = FavoritedBrandResource.find(params)

    if favorited_brand.update_attributes
      render jsonapi: favorited_brand
    else
      render jsonapi_errors: favorited_brand
    end
  end

  def destroy
    favorited_brand = FavoritedBrandResource.find(params)

    if favorited_brand.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: favorited_brand
    end
  end
end
