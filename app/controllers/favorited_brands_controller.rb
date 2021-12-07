class FavoritedBrandsController < ApplicationController
  before_action :set_favorited_brand, only: [:show, :edit, :update, :destroy]

  # GET /favorited_brands
  def index
    @favorited_brands = FavoritedBrand.all
  end

  # GET /favorited_brands/1
  def show
  end

  # GET /favorited_brands/new
  def new
    @favorited_brand = FavoritedBrand.new
  end

  # GET /favorited_brands/1/edit
  def edit
  end

  # POST /favorited_brands
  def create
    @favorited_brand = FavoritedBrand.new(favorited_brand_params)

    if @favorited_brand.save
      redirect_to @favorited_brand, notice: 'Favorited brand was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /favorited_brands/1
  def update
    if @favorited_brand.update(favorited_brand_params)
      redirect_to @favorited_brand, notice: 'Favorited brand was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /favorited_brands/1
  def destroy
    @favorited_brand.destroy
    redirect_to favorited_brands_url, notice: 'Favorited brand was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorited_brand
      @favorited_brand = FavoritedBrand.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def favorited_brand_params
      params.require(:favorited_brand).permit(:brand_id)
    end
end
