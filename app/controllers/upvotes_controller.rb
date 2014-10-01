class UpvotesController < ApplicationController
  
  def create
    @answer = Answer.find(params[:answer_id])
    @upvote = Answer.upvotes.new()
    
    if @upvote.save
      render: question_url(@answer.question)
    else
      flash.now[:errors] = @upvote.errors.full_messages
    end
  end
  
end
