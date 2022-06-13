class Api::SongsController < ApplicationController
    before_action :set_artist, except: [:all_songs]
    before_action :set_song, only: [:show, :destroy, :update]

    def all_songs
      render json: Song.all.order(play_count: :desc)
    end

    def index
      render json: @artist.songs
    end

    def show
        render json: @song
    end

    def create
       @song = @artist.songs.new(song_params)
       if(@song.save)
         render json: @song
       else
         render json: @song.errors.full_messages, status: 422
       end
    end

    def update
        if(@song.update(song_params))
          render json: @song
        else
          render json: @song.errors.full_messages, status: 422
        end
     end

    def destroy
      render json: @song.destroy 
    end
 

    private
    def set_artist
        @artist = Artist.find(params[:artist_id])
    end

    def set_song
        @song = @artist.songs.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:name, :play_count)
    end
end
