class AddSpotifyIdToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :spotify_id, :text 
  end
end
