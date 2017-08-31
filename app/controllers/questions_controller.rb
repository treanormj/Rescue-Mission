class QuestionsController < ApplicationController
# This is the controller called and the action is index. We then define the index action.
# "created_at: :asc" means ascending. You can also use ":desc" to put it in descending order, which would make the newest qustions on the top.
  def index
    @questions = Question.order(created_at: :asc)
  end


# Show puts the info on an individual page. That's why we need to make sure @question is 'singular'
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

# create makes new stuff and then saves it. So create saves what was in the form
  def create
    @question = Question.new(question_params)
    # if the question is saved correctly, it will send a notice. If it is not, it just goes back to the form page.
    if @question.save
      flash[:notice] = "Question was successfully created."
      redirect_to question_path(@question)
    else
      flash[:notice] = "You messed up."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully deleted.'
  end
    # this reduces any junk in our submissions. It keeps it with title and description. They could mess things up with curl requests.
      private
        def question_params
          params.require(:question).permit(:title, :description)
        end
  end
