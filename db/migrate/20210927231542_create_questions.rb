class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.boolean :solved, default: false, null: false
      t.datetime :solved_at

      t.timestamps
    end
  end
end
