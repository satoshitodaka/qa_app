class Admin::QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_url, notice: "質問「#{@question.title}」を削除しました。"
  end

end
