class PlaylistsController < ApplicationController

    def index 
      @playlists = Playlist.all 
    end

    def new 
      @playlist = Playlist.new 
    end

    def create 
      @playlist = Playlist.new(song_params)
      if params[:user_id]
        @user = User.find_by(id: params[:user_id])
        @playlist.user = @user
        @playlist.save 
        redirect_to user_playlist_path(@playlist)
      else
        redirect_to root_url 
      end 
    end
    
    def show 
      if params[:user_id]
        @user = User.find_by(id: params[:user_id])
        @playlist = @user.playlists.find_by(id: params[:id])
        if @playlist.nil?
            redirect_to user_path(@user)
        end
       else
        @playlist = Playlist.find(params[:id])
       end
    end

    private

    def playlist_params
      params.require(:playlist).permit(:title, :story, :artist, :genre, :spotify_id, :preview_url)
    end

end
