class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :course_id
      t.string :description

      t.timestamps
    end
  end
end
