class Answer < ActiveRecord::Base
  validates :question_id, :answer_text, presence: true
  
  belongs_to(
    :question,
    class_name: "Question",
    foreign_key: :question_id,
    primary_key: :id
  )
  
  has_many(
    :upvotes,
    class_name: "Upvote",
    foreign_key: :answer_id,
    primary_key: :id,
    dependent: :destroy
  )
end
