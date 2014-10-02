class Question < ActiveRecord::Base
  validates :question_name, presence: true
  
  has_many(
    :answers,
    class_name: "Answer",
    foreign_key: :question_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  def most_upvoted_answer_count
    Answer.find_by_sql("
    	SELECT
    	MAX(answers.upvotes_count) as maximum_count
    	FROM
    	(
    	SELECT
    	answers.*, COUNT(*) AS upvotes_count
    	FROM
    	answers
    	LEFT OUTER JOIN
    	upvotes ON upvotes.answer_id = answers.id
    	WHERE
    	answers.question_id = #{ self.id }
    	GROUP BY
    	answers.id
    	) AS answers
    ")[0].maximum_count
  end
end
