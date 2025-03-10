class WelcomeController < ApplicationController
  def index
    @collections = Collection.order("updated_at DESC")
  end
end
