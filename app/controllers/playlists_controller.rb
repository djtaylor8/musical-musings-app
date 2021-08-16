class PlaylistsController < ApplicationController

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
        @user = User.find_by(id: params[:user_id])
        @playlist = @user.playlists.find_by(id: params[:id])
        if @playlist.nil?
            redirect_to user_path(@user)
        end
       else
        @playlist = Playlist.find(params[:id])
        @comment = @playlist.comments.build
       end
    end

    def edit
      @playlist = Playlist.find(params[:id])
      @playlist_songs = @playlist.songs
    end

    def update
      @playlist = Playlist.find(params[:id])
      if params[:playlist][:song] 
        @song = Song.find_by(id: params[:playlist][:song])
        @playlist.songs << @song 
        @playlist.save
      else
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
      params.require(:playlist).permit(:title, :story, :songs_attributes => [:name, :artist, :genre, :id, :_destroy])
    end

end
