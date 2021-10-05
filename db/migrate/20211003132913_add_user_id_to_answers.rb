class AddUserIdToAnswers < ActiveRecord::Migration[5.2]
  def up
    add_reference :answers, :user, null: false, index: true
  end

  def down
    remove_reference :answers, :user, index: true
  end
end
