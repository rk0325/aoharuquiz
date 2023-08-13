class AddHintToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :hint, :string
  end
end
