module ProductsHelper
  def selected_size?(size)
    size == params[:size]
  end
end
