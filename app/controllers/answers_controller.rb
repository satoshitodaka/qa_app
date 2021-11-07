class AnswersController < BaseController
  # def new
  #   @question = Question.find(params[:id])
  #   @answer = current_user.answers.new
  # end

  def create
    @answer = current_user.answers.build(answer_params)

    if @answer.save
      # 質問投稿者にメール
      AnswerMailer.creation_email(@answer, @answer.question.user).deliver_now

      # その他回答者にメール
      answered_users = User.joins(:answers).where(answers: {question_id: @answer.question.id}).where.not(answers: {user_id: @answer.user.id}).distinct
      answered_users.each do |user|
        AnswerMailer.creation_email(@answer, user).deliver_now
      end
      redirect_to question_path(@answer.question)
    else
      redirect_to question_path(@answer.question)
    end
  end

  def edit
    @answer = current_user.answers.find(params[:id])
  end

  def update
    @answer = current_user.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_url(@answer.question), notice: '回答を編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @answer = current_user.answers.find(params[:id])
    @answer.destroy
    redirect_to question_url(@answer.question), notice: '回答を削除しました。'
  end

  private
  
    def answer_params
      params.require(:answer).permit(:body, :question_id)
    end
end
