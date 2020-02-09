class ResponsesController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def create
    @response = Response.where(
      question_id: params[:question_id],
      user: @current_user,
    ).first_or_initialize

    @response.answer = params[:answer] == 'yes'

    @response.save

    redirect_back(fallback_location: question_path(params[:question_id]))
  end
end
