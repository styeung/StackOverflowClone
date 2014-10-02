class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    
    if @answer.save
      redirect_to question_url(@question)
    else
      flash[:errors] = @answer.errors.full_messages
      redirect_to question_url(@question)
    end
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    
    if @answer.destroy
      redirect_to question_url(@question)
    else
      flash.now[:errors] = @answer.errors.full_messages
      render "questions/new"
    end
  end
  
  def answer_params
    params.require(:answer).permit(:answer_text)
  end
end
