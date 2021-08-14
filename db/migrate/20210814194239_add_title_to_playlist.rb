class AddTitleToPlaylist < ActiveRecord::Migration[6.1]
  def change
    add_column :playlists, :title, :string
  end
end
