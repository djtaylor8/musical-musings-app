class CommentsController < ApplicationController
    
    def index
      if params[:user_id]
        @user = current_user 
      else
        @playlist = Playlist.find(params[:playlist_id])
        @comment = @playlist.comments.build
      end 
    end
    
    def create
      @playlist = Playlist.find(params[:playlist_id])
      @comment = @playlist.comments.create!(comment_params)
      @comment.user = current_user 
      @comment.save
      redirect_to playlist_comments_path(@playlist)
    end

    def destroy 
      @playlist = Playlist.find(params[:playlist_id])
      @comment = @playlist.comments.find(params[:id])
      @comment.destroy 
      redirect_to playlist_comments_path(@playlist)
    end

    private 

    def comment_params
      params.require(:comment).permit(:content, :playlist_id, :user_id)
    end

end
