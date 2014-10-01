class Question < ActiveRecord::Base
  validates :question_name, presence: true
  
  
end
