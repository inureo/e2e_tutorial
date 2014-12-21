class CreateJapaneseSyllabaries < ActiveRecord::Migration
  def change
    create_table :japanese_syllabaries do |t|
      t.string :char, null: false
      t.timestamps
    end
  end
end
