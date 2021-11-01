class QuestionsController < ApplicationController
  before_action :closed_question, only: [:update, :destroy, :close]
  before_action :own_question, only: [:edit, :destroy, :close]

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page])
  end

  def unsolved
    @q = Question.where(solved: false).ransack(params[:q])
    @unsolved_questions = @q.result(distinct: true).page(params[:page])
  end

  def solved
    @q = Question.where(solved: true).ransack(params[:q])
    @solved_questions = @q.result(distinct: true).page(params[:page])
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = current_user.answers.new
    @user = current_user
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    
    if @question.save
      @users = User.all.where.not(id: current_user.id)
      @users.each do |user|
        QuestionMailer.creation_email(@question, user).deliver_now
      end
      redirect_to questions_url, notice: "質問「#{@question.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    question = current_user.questions.find(params[:id])

    if question.update(question_params)
      redirect_to question_url, notice: "タスク「#{question.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    question = current_user.questions.find(params[:id])
    question.destroy
    redirect_to questions_url, notice: "タスク「#{question.title}」を」を削除しました。"
  end

  def close
    question = current_user.questions.find(params[:id])
    question.close_question
    redirect_to question_url, notice: "タスク「#{question.title}」を解決済に変更しました。"
  end

  private
    def question_params
      params.require(:question).permit(:title, :question_body).merge(solved: false)
    end

    def closed_question
      question =  Question.find(params[:id])
      if question.solved
        redirect_to question_url, notice: '解決済みの質問は操作できません。'
      end
    end

    def own_question
      question =  Question.find(params[:id])
      if question.user != current_user
        redirect_to question_url, notice: '他ユーザーの質問は操作できません。'
      end
    end
end
