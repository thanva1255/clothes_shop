class Product::ProductDecorator < Draper::Decorator
  delegate_all

  def decorated
    product = object

    Product::ProductDecorator.new(decorated_production(product))
  end

  def decorated_production(product)
    {
      basic_data: decorated_basic_data(product),
      product_variants: decorated_button_size(product)
    }
  end

  def decorated_basic_data(product)
    {
      image: product.image_url,
      collection: product.collection.name,
      name: product.name,
      description: product.description
    }
  end

  def decorated_button_size(product)
      varaints = product.variants

      varaints.map do |varaint|
        {
          label: varaint.size,
          path: h.product_path(
            id: product.id,
            size: varaint.size,
            stock: varaint.stock,
            price: varaint.price,
            image: varaint.image_url
          )
        }
      end
  end
end
