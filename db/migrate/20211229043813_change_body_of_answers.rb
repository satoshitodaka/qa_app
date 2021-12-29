class ChangeBodyOfAnswers < ActiveRecord::Migration[5.2]
  def up
    change_column :answers, :body, :text
  end

  def down
    change_column :answers, :body, :string
  end
end
