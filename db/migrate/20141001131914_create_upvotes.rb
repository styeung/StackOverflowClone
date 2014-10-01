class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :answer_id, null: false
      
      t.timestamps
    end
    
    add_index :upvotes, :answer_id
  end
end
