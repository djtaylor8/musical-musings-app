class PlaylistsController < ApplicationController
  skip_before_action :authorize, :only => [:index, :recent]
  load_and_authorize_resource

    def recent 
      @playlists = Playlist.recent 
    end
  
    def index 
      @playlists = Playlist.all 
    end

    def new 
      @playlist = Playlist.new
    end

    def create 
      @playlist = Playlist.new(playlist_params)
      @playlist.user = current_user  

      if @playlist.save 
        redirect_to playlist_path(@playlist)
      else
        render :new
      end
    end
    
    def show 
      if params[:user_id]
        @user = current_user 
        @playlist = @user.playlists.find_by(id: params[:id])
        if @playlist.nil?
            redirect_to user_path(@user)
        end
       else
        @playlist = Playlist.find(params[:id])
       end
    end

    def edit
      @playlist = Playlist.find(params[:id])
      @playlist_songs = @playlist.songs
    end

    def update
      if params[:playlist][:id]
        @playlist = Playlist.find_by(id: params[:playlist][:id]) 
        @song = Song.find_by(id: params[:playlist][:song])
        @playlist.songs << @song 
        @playlist.save
      else
        @playlist = Playlist.find(params[:id])
        @playlist.update(playlist_params)
        @playlist.save
      end 
      redirect_to playlist_path(@playlist)
    end

    def destroy 
      @playlist = Playlist.find(params[:id])
      @playlist.destroy 
      redirect_to user_path(current_user)
    end

    private

    def playlist_params
      params.require(:playlist).permit(:title, :story, :image_url, :songs_attributes => [:name, :artist, :genre, :id, :_destroy])
    end

end
