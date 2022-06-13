class Api::SongsController < ApplicationController

    def index
      @artist = Artist.find(params[:artist_id])
      render json: @artist.songs
    end

    def show
        @artist = Artist.find(params[:artist_id])
        @song = @artist.songs.find(params[:id])
       
        render json: @song
    end
end
