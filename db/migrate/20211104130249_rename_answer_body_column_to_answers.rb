class RenameAnswerBodyColumnToAnswers < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :answer_body, :body
  end
end
