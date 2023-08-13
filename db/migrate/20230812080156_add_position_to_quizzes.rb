class AddPositionToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :position, :integer
  end
end
