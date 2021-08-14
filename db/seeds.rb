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

lou = User.create!(name: "Lou", email: "lou@me.com", password: "hi")
georgia = User.create!(name: "Georgia", email: "georgia@me.com", password: "hi")
dolly = User.create!(name: "Dolly", email: "dolly@me.com", password: "hi")
chance = User.create!(name: "Chance", email: "chance@me.com", password: "hi")
kishi = User.create!(name: "Kishi", email: "kishi@me.com", password: "hi")

play_1 = Playlist.create!(story: "test", user: lou)
play_2 = Playlist.create!(story: "test", user: georgia)
play_3 = Playlist.create!(story: "test", user: dolly)
play_4 = Playlist.create!(story: "test", user: chance)
play_5 = Playlist.create!(story: "test", user: kishi)
