class Cloth::Product
  def create_product(name:, image_url:, description:, collection_id:, category_id:)
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
end
