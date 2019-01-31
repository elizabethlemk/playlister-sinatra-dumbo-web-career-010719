class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"/songs/new"
  end

  post '/songs' do
    @song = Song.create(params["song"])
    @song_genre = SongGenre.create(genre_id: params["song_genre"]["genre_id"], song_id: @song.id)
    redirect to("/songs/#{@song.id}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  get '/songs/:slug/edit' do
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    @song_genre = SongGenre.find(params[:slug])
    erb :"/songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song_genre = SongGenre.find(params[:slug])
    @song.update(params["song"])
    @song_genre.update(genre_id: params["song_genre"]["genre_id"], song_id: @song.id)
    redirect to("/songs/#{@song.id}")
  end

  delete '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.destroy
    redirect to("/songs")
  end
end
