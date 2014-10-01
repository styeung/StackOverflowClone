class Upvote < ActiveRecord::Base
  validates :answer_id, presence: true
  
  belongs_to(
    :answer,
    class_name: "Answer",
    foreign_key: :answer_id,
    primary_key: :id
  )
  
end
