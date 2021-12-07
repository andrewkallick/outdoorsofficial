class FavoritedBrandsController < ApplicationController
  before_action :set_favorited_brand, only: [:show, :edit, :update, :destroy]

  # GET /favorited_brands
  def index
    @q = FavoritedBrand.ransack(params[:q])
    @favorited_brands = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)
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
      message = 'FavoritedBrand was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @favorited_brand, notice: message
      end
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
    message = "FavoritedBrand was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to favorited_brands_url, notice: message
    end
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
