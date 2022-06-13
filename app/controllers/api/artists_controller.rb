class Api::ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :update, :destroy]

    def everything
      render json: {songs: Song.all, artist: Artist.all}
    end

    def index
      render json: Artist.all
    end

    # let res = await axios.get('/api/artists')
    # setUsers(res.data) res.data is Artist.all result

    def show
        # render json: @artist
        render json: {artist: @artist, songs: @artist.songs}
    end

    def create
        @artist = Artist.new(artist_params)
        if(@artist.save)
            render json: @artist
        else
            render json: {errors: @artist.errors.full_message, foo:'x'}, status: 422
        end
    end

    def update
        if(@artist.update(artist_params))
            render json: @artist
        else
            render json: @artist.errors.full_message, status: 422
        end
    end

    def destroy
        render json: @artist.destroy
    end


    private

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :fans)
    end

end
