class ProductsController < ApplicationController
  before_action :update_category_as_selected, only: [ :index ]

  def initialize
    super

    @product_domain = Cloth::Product.new
    @variant_domain = Cloth::Variant.new
  end
  def index
    @categories = Category.all
  end

  def show
    product = Product.find(params[:id])

    @resource = ProductDecorator.new(product).decorated
  end

  def new; end

  def create
    product = @product_domain.create_product(
      name: params[:name],
      image_url: params[:image_url],
      description: params[:description],
      collection_id: params[:collection_id],
      category_id: params[:category_id]
    )

    params[:size].each do |key, value|
      @variant_domain.create_variant(
        product_id: product.id,
        size: value[:size_name].to_i,
        price: value[:price].to_i,
        stock: value[:stock].to_i,
        image_url: value[:image_url]
      )
    end

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
