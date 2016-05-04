class AddProfileIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_id, :integer, index: true, foreign_key: true
  end
end
