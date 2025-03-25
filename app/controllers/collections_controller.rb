class CollectionsController < ApplicationController
  def initialize
    super

    @collection_domain = Cloth::Collection.new
  end

  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new; end

  def create
    @collection_domain.create_collection(
      name: params[:name],
      description: params[:description]
    )

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to collections_path }
    end
  end
end
