class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end


  def create
    @question = Question.find(params[:question_id])

    @answer = Answer.new(answer_params)
    @answer.question = @question
  # if the question is saved correctly, it will send a notice. If it is not, it just goes back to the form page.
  if @answer.save
    redirect_to question_path(@question), notice: "Answer was successfully created."
  else
    render :new
  end
end
  # this reduces any junk in our submissions. It keeps it with title and description. They could mess things up with curl requests.
    private
      def answer_params
        params.require(:answer).permit(:title, :description)
      end
end
