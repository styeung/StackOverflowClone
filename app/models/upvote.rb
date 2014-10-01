class Upvote < ActiveRecord::Base
  validates :answer_id, presence: true
  
end
