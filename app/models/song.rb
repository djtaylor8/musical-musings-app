class Song < ApplicationRecord
    has_many :playlist_songs
    has_many :playlists, through: :playlist_songs 

    accepts_nested_attributes_for :playlists 

    def new_from_spotify(spotify_track)
      Song.create(
          title: spotify_track.name,
          artist: spotify_track.artists[0].name,
          genre: spotify_track.artists[0].genres[0],
          image: spotify_track.album.images[0]["url"],
          preview: spotify_track.preview_url
      )
    end
    
end
