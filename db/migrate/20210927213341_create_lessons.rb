class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :name
      t.integer :lesson_id
      t.integer :lesson_number
      t.string :lesson_text

      t.timestamps
    end
  end
end
