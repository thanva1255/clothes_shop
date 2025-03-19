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
    product = Product.new(
      name: params[:name],
      image_url: params[:image_url],
      description: params[:description],
      collection_id: params[:collection_id],
      category_id: params[:category_id]
    )

    product.save

    small_size = Variant.new(
      product_id: product.id,
      size: "small",
      price: params[:size_s_price],
      stock: params[:size_s_stock],
      image_url: params[:size_s_image_url]
    )
    medium_size = Variant.new(
      product_id: product.id,
      size: "medium",
      price: params[:size_m_price],
      stock: params[:size_m_stock],
      image_url: params[:size_m_image_url]
    )
    large_size = Variant.new(
      product_id: product.id,
      size: "large",
      price: params[:size_l_price],
      stock: params[:size_l_stock],
      image_url: params[:size_l_image_url]
    )
    extra_large_size = Variant.new(
      product_id: product.id,
      size: "extra_large",
      price: params[:size_xl_price],
      stock: params[:size_xl_stock],
      image_url: params[:size_xl_image_url]
    )

    small_size.save
    medium_size.save
    large_size.save
    extra_large_size.save

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to products_path }
    end
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
