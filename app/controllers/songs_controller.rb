class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
    @genres = Genre.all
  end

  def create
    byebug

    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      redirect_to new_song_path
    end
  end

  def edit
  end

  def update

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      redirect_to edit_song_path
    end
  end

  def destroy
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
