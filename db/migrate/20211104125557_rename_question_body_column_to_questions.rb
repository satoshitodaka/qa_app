class RenameQuestionBodyColumnToQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :question_body, :body 
  end
end
