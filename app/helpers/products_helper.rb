module ProductsHelper
  def selected_size?(variant_id)
    variant_id == params[:variant].to_i
  end

  def selected_category?(category_id)
    category_id == params[:category_id].to_i
  end
end
