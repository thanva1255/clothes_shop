module ProductsHelper
  def selected_size?(size)
    if size == params[:size]
      true
    else
      false
    end
  end
end
