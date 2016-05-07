class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :title, index: true
      t.timestamps null: false
    end
    add_index :albums, [:user_id, :title]
  end
end
