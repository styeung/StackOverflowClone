class QuestionsController < ApplicationController
  
  def index
    # @questions = Question.select("questions.*, count(*) AS answers_count")
#                          .joins(answers: :upvotes)
#                          .group("questions.id")
#                          .all
#                          .order(created_at: :desc)
    
    
    @questions = Question.find_by_sql("
                  SELECT
                  questions.*, COUNT(*) AS answers_count, MAX(answers_mod.upvotes_count) AS maximum_count
                  FROM
                  questions
                  LEFT OUTER JOIN
                  (
                  SELECT
                  question_id, COUNT(*) AS upvotes_count
                  FROM
                  answers
                  LEFT OUTER JOIN
                  upvotes ON upvotes.answer_id = answers.id
                  GROUP BY
                  answers.id
                  ) AS answers_mod ON answers_mod.question_id = questions.id
                  GROUP BY
                  questions.id
                  ")
    
    render :index
  end
    
  def new
    @question = Question.new
    
    render :new
  end
  
  def create
    @question = Question.new(question_params)
    
    if @question.save
      redirect_to question_url(@question)
    else
      flash.now[:errors] = @question.errors.full_messages
    end
      
  end
  
  def show
    @question = Question.includes(answers: :upvotes).find(params[:id])
    @answers = @question.answers.sort { |x, y| y.upvotes.length <=> x.upvotes.length }
    
    render :show
  end
  
  def destroy
    @question = Question.find(params[:id])
    
    if @question.destroy
      redirect_to questions_url
    else
      flash.now[:errors] = @question.errors.full_messages
    end
  end
  
  def question_params
    params.require(:question).permit(:question_name, :question_body)
  end
end
