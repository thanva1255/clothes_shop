class Product::CategoryButtonGroupDecorator < Draper::Decorator
  delegate_all

  def decorated
    Shared::ButtonGroupDecorator.new([
      :category,
      decorate_buttons()
    ]).decorated
  end

  def decorate_buttons
    [
      Shared::ButtonDecorator.new([
        "All",
        h.products_path,
        nil
      ]).decorated
    ] +
    Category.all.map do |category|
      Shared::ButtonDecorator.new([
        category.name.titleize,
        h.products_path(category: category.name),
        category.name
      ]).decorated
    end
  end
end
