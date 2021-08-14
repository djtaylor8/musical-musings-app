# App Overview

Musical Musings is a tool for users to create and tell stories through playlists they create using Spotify.

# User Stories

## Users will be able to ...
- sign up, log in, log out
- search songs via Spotify by song title, artist, or genre
- create new playlists based on search results
- create new stories thematically related to playlist songs
- view other stories 
- comment on stories

## As a user, I can...
- Create playlists and stories using Spotify
- Utilize CRUD functionality for my profile
- View other posts and comment on playlists/stories 

# Wireframing 

## Models: User, Playlist, Song, PlaylistSong (Join Table), Comment 

## User

### Attributes

- name 
- email 
- password_digest 
- bio 

### Associations

- has_many :playlists
- has_many :comments 
- has_many :playlists, through: :comments

## Playlist  

### Attributes

- description/story     

### Associations

- belongs_to :user
- has_many :playlist_songs
- has_many :songs, through: :playlist_songs
- has_many :comments
- has_many :users, through: :comments

## Song

### Attributes

- title
- artist
- genre
- image
- preview

### Associations

- has_many :playlist_songs
- has_many :playlists, through: :playlist_songs 

## PlaylistSong (Join Table)

### Attributes

- playlist_id 
- song_id

### Associations

- belongs_to :playlist
- belongs_to :song

## Comments

### Attributes

- text content
- user_id
- playlist_id   

### Associations

- belongs_to :user 
- belongs_to :playlist 

#MVP (Minimum viable product)

- Users can sign up, create a profile, log in/out, view and create their own playlists/stories, view other playlists/stories and comment on others' work 

# Stretch Goals

- A lot of this feels like a stretch at the moment, so stay tuned...