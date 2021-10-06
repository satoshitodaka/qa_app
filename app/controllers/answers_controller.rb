class AnswersController < ApplicationController
  # def new
  #   @question = Question.find(params[:id])
  #   @answer = current_user.answers.new
  # end

  def create
    @answer = current_user.answers.new(answer_params)

    if @answer.save
      redirect_back(fallback_location: root_path)
      # redirect_to question_url(@question), notice: '回答を作成しました。'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @answer = current_user.answers.find(params[:id])
  end

  def update
    @answer = current_user.answers.find(params[:id])
    @answer.update(answer_params)
    redirect_to question_url(@answer.question), notice: '回答を編集しました。'
  end

  def destroy
    @answer = current_user.answers.find(params[:id])
    @answer.destroy
    redirect_to question_url(@answer.question), notice: '回答を削除しました。'
  end

  private
    def answer_params
      params.require(:answer).permit(:answer_body, :question_id)
    end
end
