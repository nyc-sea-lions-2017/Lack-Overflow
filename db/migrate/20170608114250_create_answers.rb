class CreateAnswers < ActiveRecord::Migration
  def change
      create_table :answers do |t|
      t.string :text, null: false
      t.integer :answerer_id,  foreign_key: true
      t.integer :question_id, foreign_key: true

      t.timestamps
    end
  end
end
