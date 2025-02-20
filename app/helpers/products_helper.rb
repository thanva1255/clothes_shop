module ProductsHelper
  def selected_category?(category_id)
    category_id == params[:category_id].to_i
  end
end
