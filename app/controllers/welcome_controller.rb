class WelcomeController < ApplicationController
  def index
    @collections = Collection.all
  end
end
