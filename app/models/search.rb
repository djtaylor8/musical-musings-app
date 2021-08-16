class Search < ApplicationRecord

    def find_songs(keywords)
      search_results = RSpotify::Track.search("#{keywords}")
      songs = search_results.first(7).map do |song|
        Song.find_or_create_by(
            name: song.name,
            artist: song.artists[0].name,
            genre: song.artists[0].genres[0],
            image: song.album.images[0]["url"],
            preview: song.preview_url,
            spotify_id: song.id  
            )
        end
        songs 
    end

end
