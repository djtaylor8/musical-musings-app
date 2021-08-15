class SearchesController < ApplicationController

    def new 
      @search = Search.new 
    end

    def create 
      @search = Search.create!(search_params) 
      redirect_to @search 
    end

    def show 
      @search = Search.find(params[:id])
      @songs = @search.find_songs(@search.keywords) 
    end

    private 

    def search_params
      params.require(:search).permit(:keywords)
    end

end
