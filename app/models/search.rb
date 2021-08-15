class Search < ApplicationRecord

    def find_songs(keywords)
      song_results = RSpotify::Track.search("#{keywords}")
      new_songs = song_results.first(7).map do |song|
        Song.create!(
            name: song.name,
            artist: song.artists[0].name,
            genre: song.artists[0].genres[0],
            image: song.album.images[0]["url"],
            preview: song.preview_url,
            spotify_id: song.id  
            )
        end
        new_songs 
    end

end
