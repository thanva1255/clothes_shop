class ProductDecorator < Draper::Decorator
  delegate_all

  def decorated
    product, variant= object

    ProductDecorator.new(
      {
        basic_data: decorated_basic_data(product),
        product_variants: decorated_button_size(product),
        variant_selected: decorated_variant_selected(variant)
      }
    )
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
      variants = product.variants

      variants.map do |variant|
        {
          id: variant.id,
          label: variant.size,
          path: h.product_path(
            product,
            variant: variant.id
          )
        }
      end
  end

  def decorated_variant_selected(variant)
    {
      image: variant&.image_url,
      price: variant&.price,
      stock: variant&.stock
    }
  end
end
