class Cloth::Product
  def create_product(
    name:,
    image_url:,
    description:,
    collection_id:,
    category_id:
  )
    product = Product.new(
      name:,
      image_url:,
      description:,
      collection_id:,
      category_id:
    )

    product.save

    product
  end

  def update_product(
    id:,
    name:,
    image_url:,
    description:,
    collection_id:,
    category_id:
  )
    product = Product.find(id)

    update_attributes = {
      name:,
      image_url:,
      description:,
      collection_id:,
      category_id:
    }.compact

    product.update(update_attributes)

    product
  end
end
