class ProductsController < ApplicationController
  before_action :update_category_as_selected, only: [ :index ]
  def index
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private
    def update_category_as_selected
      category_id = params[:category]

      if category_id != nil
        selected_category = Category.find(category_id)
        @products = selected_category.products
        @selected_category_name = selected_category.name
        @selected_category_id = selected_category.id
        @is_show_all_category = false
      else
        @products = Product.all
        @selected_category_name = "Products"
        @selected_category_id = nil
        @is_show_all_category = true
      end
    end
end
