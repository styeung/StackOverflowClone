class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_name, null: false
      
      t.timestamps
    end
    
    add_index :questions, :question_name
  end
end
