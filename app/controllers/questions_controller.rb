class QuestionsController < ApplicationController
  before_action :closed_question?, only: [:update, :destroy, :close]

  def index
    @questions = Question.all
  end

  def unsolved
    @unsolved_questions = Question.where(solved: false)
  end

  def solved
    @solved_questions = Question.where(solved: true)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    
    if @question.save
      redirect_to questions_url, notice: "質問「#{@question.title}」を登録しました。"
      # メールを送信する処理
    else
      render :new
    end
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    question = current_user.questions.find(params[:id])
    question.update!(question_params)
    redirect_to question_url, notice: "タスク「#{question.title}」を更新しました。"
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
      params.require(:question).permit(:title, :content).merge(solved: false)
    end

    def closed_question?
      question =  Question.find(params[:id])
      if question.solved
        redirect_to question_url, notice: '解決済みの質問は操作できません。'
      end
    end
end
