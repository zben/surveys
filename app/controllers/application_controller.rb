class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = User.where(name: 'Test User').first_or_create
  end
end
