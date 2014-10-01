class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.text :answer_text, null: false
      
      t.timestamps
    end
    
    add_index :answers, :question_id
    add_index :answers, :answer_text
    
  end
end
