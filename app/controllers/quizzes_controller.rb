class QuizzesController < ApplicationController
  before_action :set_initial_session, only: [:show]

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @current_question_number = Quiz.where("id <= ?", @quiz.id).count
  end

  def answer
    @quiz = Quiz.find(params[:id])

    # 正解の場合、スコアを増やす
    session[:score] += 1 if params[:answer] == @quiz.answer

    # 次のクイズへ
    next_quiz = Quiz.where("id > ?", @quiz.id).first
    if next_quiz
      session[:current_quiz_id] = next_quiz.id
      redirect_to quiz_path(next_quiz)
    else
      # 全てのクイズが完了した場合
      redirect_to result_quizzes_path
    end
  end

  def result
    @score = session[:score]
    # セッションをリセット
    reset_session
  end

  private

  def set_initial_session
    unless session[:current_quiz_id]
      session[:current_quiz_id] = Quiz.first.id
      session[:score] = 0
    end
  end
end
