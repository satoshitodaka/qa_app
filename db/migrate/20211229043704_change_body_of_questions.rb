class ChangeBodyOfQuestions < ActiveRecord::Migration[5.2]
  def up
    change_column :questions, :body, :text
  end

  def down
    change_column :questions, :body, :string
  end
end
