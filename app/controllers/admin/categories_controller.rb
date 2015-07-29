class Admin::CategoriesController < Admin::BaseController

  def index
    @songs = Song.all
  end


end