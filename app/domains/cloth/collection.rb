class Cloth::Collection
  def create_collection(
    name:,
    description:
  )
    collection = Collection.new(
      name:,
      description:
    )

    collection.save

    collection
  end
end
