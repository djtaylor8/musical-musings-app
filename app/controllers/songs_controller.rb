class SongsController < ApplicationController

    def new
      @song = Song.new 
    end

    def create 
      @song = Song.find_by(params[:id]) 
      @playlist = Playlist.find_by(title: params[:playlist][:title])
      redirect_to playlist_path(@playlist)
    end

    def show 
      @song = Song.find_by(id: params[:id])
      @user = current_user 
      @playlist = Playlist.all.find_by(user: current_user)
    end

    private 

    def song_params
      params.require(:song).permit(:name, :artist, :genre, :preview_url, :spotify_id, :title)
    end
end
