class CollectionsController < ApplicationController
  def index
  end

  def show
    @collection = Collection.find(params[:id])
  end
end
