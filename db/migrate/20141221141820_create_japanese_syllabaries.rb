class CreateJapaneseSyllabaries < ActiveRecord::Migration
  def change
    create_table :japanese_syllabaries do |t|

      t.timestamps
    end
  end
end
