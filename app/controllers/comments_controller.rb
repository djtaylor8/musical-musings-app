class CommentsController < ApplicationController
    
    def create
      @playlist = Playlist.find(params[:playlist_id])
      @comment = @playlist.comments.create!(comment_params)
      byebug
      redirect_to playlist_path(@playlist)
    end

    def destroy 
      @playlist = Playlist.find(params[:playlist_id])
      @comment = @playlist.comments.find(params[:id])
      @comment.destroy 
      redirect_to playlist_path(@playlist)
    end

    private 

    def comment_params
      params.require(:comment).permit(:content, :playlist_id)
    end

end
