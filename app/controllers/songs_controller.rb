class SongsController < ApplicationController

    def new
      @song = Song.new 
    end

    def show 
      @song = Song.find_by(id: params[:id])
    end
end
