class Admin::AnswersController < ApplicationController
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy!
    redirect_to admin_question_url(@answer.question), notice: '回答を削除しました。'
  end
end
