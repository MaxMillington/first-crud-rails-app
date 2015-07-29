class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
    session[:most_recent_song_title] = @songs.last.title
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    current_user.songs << @song
    if @song.save
      flash[:alert] = "#{@song.title} has been created"
      redirect_to song_path(@song.id)
    else
      flash[:notice] = "Song cannot be created without a title."
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song.id)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def set_song
    @song = Song.find(params[:id])
  end

end