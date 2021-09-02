class AddImgUrlToPlaylists < ActiveRecord::Migration[6.1]
  def change
    add_column :playlists, :image_url, :text
  end
end
