class QuestionsController < ApplicationController
  
  def index
    @questions = Questions.all
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
    @question = Question.find(params[:id])
    
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
    params.require(:question).permit(:question_name)
  end
end
