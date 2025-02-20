module ProductsHelper
  def selected_category?(selected_category, category_id)
    return false if selected_category == nil
    return false if selected_category != category_id

    true
  end
end
