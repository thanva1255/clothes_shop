class ProductsController < ApplicationController
  before_action :update_category_as_selected, only: [ :index ]

  def index
    @categories = Category.all
  end

  def show
    @size = params[:size]
    @product = Product.find(params[:id])
    @variant = Variant.find_by(product_id: params[:id], size: @size)
    @name = @product.name
    @collection = @product.collection.name
    @description = @product.description
    @variants = @product.variants

    if @variant.nil?
      @image = @product.image_url
    else
      @price = @variant.price.to_i
      @stock = @variant.stock
      @image = @variant.image_url
    end
  end

  def new; end

  def create
  end

  private
    def update_category_as_selected
      category_id = params[:category_id]

      if category_id != nil
        selected_category = Category.find(category_id)
        @products = selected_category.products
        @selected_category_name = selected_category.name
        @is_show_all_category = false
      else
        @products = Product.all
        @selected_category_name = "Products"
        @is_show_all_category = true
      end
    end
end
