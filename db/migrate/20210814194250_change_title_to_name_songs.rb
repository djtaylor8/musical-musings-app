class ChangeTitleToNameSongs < ActiveRecord::Migration[6.1]
  def change
    rename_column :songs, :title, :name
  end
end
