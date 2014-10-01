class AddBodyColumnToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :question_body, :text, null: false
  end
end
