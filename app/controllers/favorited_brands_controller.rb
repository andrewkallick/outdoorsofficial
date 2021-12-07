class FavoritedBrandsController < ApplicationController
  before_action :set_favorited_brand, only: %i[show edit update destroy]

  def index
    @q = FavoritedBrand.ransack(params[:q])
    @favorited_brands = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @favorited_brand = FavoritedBrand.new
  end

  def edit; end

  def create
    @favorited_brand = FavoritedBrand.new(favorited_brand_params)

    if @favorited_brand.save
      message = "FavoritedBrand was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @favorited_brand, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @favorited_brand.update(favorited_brand_params)
      redirect_to @favorited_brand,
                  notice: "Favorited brand was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @favorited_brand.destroy
    message = "FavoritedBrand was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to favorited_brands_url, notice: message
    end
  end

  private

  def set_favorited_brand
    @favorited_brand = FavoritedBrand.find(params[:id])
  end

  def favorited_brand_params
    params.require(:favorited_brand).permit(:brand_id)
  end
end
