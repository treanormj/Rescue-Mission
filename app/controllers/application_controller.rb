class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @questions = Question.all
  end
  
end
