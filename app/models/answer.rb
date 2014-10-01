class Answer < ActiveRecord::Base
  validates :question_id, :answer_text, presence: true
end
