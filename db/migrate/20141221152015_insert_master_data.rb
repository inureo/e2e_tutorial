class InsertMasterData < ActiveRecord::Migration
  def change
    %w(あ い う え お か き く け こ さ し す せ そ た ち つ て と な に ぬ ね の は ひ ふ へ ほ ま み む め も や ゆ よ ら り る れ ろ わ ゐ ゑ を).each do |char|
      JapaneseSyllabary.create(char: char)
    end
  end
end
