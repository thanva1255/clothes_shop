class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @size = params[:size]
    @product = Product.find(params[:id])
    @variant = Variant.find_by(product_id: params[:id], size: @size)
    @name = @product.name
    @collection = @product.collection.name
    @description = @product.description

    if @variant.nil?
      @image = @product.image_url
    else
      @price = @variant.price.to_i
      @stock = @variant.stock
      @image = @variant.image_url
    end
  end
end
