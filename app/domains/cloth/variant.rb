class Cloth::Variant
  def create_variant(product_id:, size:, price:, stock:, image_url:)
    variant = Variant.new(
      product_id:,
      size:,
      price:,
      stock:,
      image_url:
    )

    variant.save!

    variant
  end
end
