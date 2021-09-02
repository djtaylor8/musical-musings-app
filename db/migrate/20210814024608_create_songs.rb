class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.text :title
      t.text :artist
      t.text :genre
      t.text :image
      t.text :preview

      t.timestamps
    end
  end
end
