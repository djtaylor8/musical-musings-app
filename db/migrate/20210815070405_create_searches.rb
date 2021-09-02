class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.text :keywords

      t.timestamps
    end
  end
end
