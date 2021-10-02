class AddSectionToLessons < ActiveRecord::Migration[6.1]
  def change
    add_reference :lessons, :section, null: false, foreign_key: true
  end
end
