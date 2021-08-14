spotify_tracks = RSpotify::Playlist.browse_featured.first.tracks 

spotify_tracks.each do |song|
    Song.create!(
        title: song.name,
        artist: song.artists[0].name,
        genre: song.artists[0].genres[0],
        image: song.album.images[0]["url"],
        preview: song.preview_url 
    )
end

User.create!(name: "Lou", email: "lou@me.com", password: "hi")