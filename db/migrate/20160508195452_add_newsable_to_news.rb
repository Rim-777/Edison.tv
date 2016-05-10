class AddNewsableToNews < ActiveRecord::Migration
  def change
    add_belongs_to :news,  :newsable, index: true
    add_column :news, :newsable_type, :string
    add_index :news, [:newsable_id, :newsable_type]
  end
end
