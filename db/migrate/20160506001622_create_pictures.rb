class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :album, index: true, foreign_key: true
      t.string :title, index: true
      t.timestamps null: false
    end
    add_index :pictures, [:user_id, :album_id]
    add_index :pictures, [:user_id, :title]
    add_index :pictures, [:album_id, :title]
  end
end
