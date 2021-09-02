class AddUidToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :text
    add_column :users, :provider, :text
  end
end
