class BrandsController < ApplicationController
  before_action :set_brand, only: %i[show edit update destroy]

  def index
    @q = Brand.ransack(params[:q])
    @brands = @q.result(distinct: true).includes(:comments).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
  end

  def new
    @brand = Brand.new
  end

  def edit; end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to @brand, notice: "Brand was successfully created."
    else
      render :new
    end
  end

  def update
    if @brand.update(brand_params)
      redirect_to @brand, notice: "Brand was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @brand.destroy
    redirect_to brands_url, notice: "Brand was successfully destroyed."
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name, :description, :image, :sport,
                                  :category, :pricepoint, :highlyrated)
  end
end
