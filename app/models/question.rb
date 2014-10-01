class Question < ActiveRecord::Base
  validates :question_name, presence: true
  
  has_many(
    :answers,
    class_name: "Answer",
    foreign_key: :question_id,
    primary_key: :id,
    dependent: :destroy
  )
end
