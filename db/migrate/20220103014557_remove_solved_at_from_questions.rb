class RemoveSolvedAtFromQuestions < ActiveRecord::Migration[5.2]
  def up
    remove_column :questions, :solved_at
  end

  def down
    add_column :questions, :solved_at, :datetime
  end
end
