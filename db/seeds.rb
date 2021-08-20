spotify_tracks = RSpotify::Playlist.browse_featured.first.tracks 

spotify_tracks.each do |song|
    Song.create!(
        name: song.name,
        artist: song.artists[0].name,
        genre: song.artists[0].genres[0],
        image: song.album.images[0]["url"],
        preview: song.preview_url,
        spotify_id: song.id  
    )
end

lou = User.create!(name: "Lou", email: "lou@me.com", password: "hi")
georgia = User.create!(name: "Georgia", email: "georgia@me.com", password: "hi")
dolly = User.create!(name: "Dolly", email: "dolly@me.com", password: "hi")
chance = User.create!(name: "Chance", email: "chance@me.com", password: "hi")
kishi = User.create!(name: "Kishi", email: "kishi@me.com", password: "hi")

play_1 = Playlist.create!(title: "Sample Playlist 1", story: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur, eum voluptatum sint iste aliquid cupiditate sed tempora a possimus consequatur nihil, corrupti beatae? Ad repellendus iste atque natus cum architecto!", user: lou, image_url: "https://images.unsplash.com/photo-1493612276216-ee3925520721?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60" )
play_2 = Playlist.create!(title: "Sample Playlist 2", story: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur, eum voluptatum sint iste aliquid cupiditate sed tempora a possimus consequatur nihil, corrupti beatae? Ad repellendus iste atque natus cum architecto...", user: georgia, image_url: "https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80")
play_3 = Playlist.create!(title: "Sample Playlist 3", story: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur, eum voluptatum sint iste aliquid cupiditate sed tempora a possimus consequatur nihil, corrupti beatae? Ad repellendus iste atque natus cum architecto?", user: dolly, image_url: "https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cmFuZG9tfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60")
play_4 = Playlist.create!(title: "Sample Playlist 4", story: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur, eum voluptatum sint iste aliquid cupiditate sed tempora a possimus consequatur nihil, corrupti beatae? Ad repellendus iste atque natus cum architecto", user: chance, image_url: "https://images.unsplash.com/photo-1550686041-366ad85a1355?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60")
play_5 = Playlist.create!(title: "Sample Playlist 5", story: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur, eum voluptatum sint iste aliquid cupiditate sed tempora a possimus consequatur nihil, corrupti beatae? Ad repellendus iste atque natus cum architecto..", user: kishi, image_url: "https://images.unsplash.com/photo-1484100356142-db6ab6244067?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJhbmRvbXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60")

songs = Song.all.first(5)
play_1.songs << songs 

