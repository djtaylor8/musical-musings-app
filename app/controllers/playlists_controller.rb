class PlaylistsController < ApplicationController

    def index 
      @playlists = Playlist.all 
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

end
