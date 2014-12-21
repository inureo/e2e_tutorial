class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :user_id, null: false
      t.integer :japanese_syllabary_id, null: false
      t.string :text, null: false
      t.timestamps
    end
  end
end
