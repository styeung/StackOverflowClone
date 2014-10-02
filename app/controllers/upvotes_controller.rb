class UpvotesController < ApplicationController
  
  def create
    @answer = Answer.includes(:upvotes).find(params[:answer_id])
    @upvote = @answer.upvotes.new()
    
    
    if @upvote.save
      render json: @answer.upvotes.length
    else
      flash.now[:errors] = @upvote.errors.full_messages
    end
  end
  
end
