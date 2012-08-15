class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :front
      t.text :back
      t.belongs_to :deck

      t.timestamps
    end
    add_index :cards, :deck_id
  end
end
