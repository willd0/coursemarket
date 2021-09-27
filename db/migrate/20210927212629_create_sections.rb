class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :section_id
      t.integer :section_number

      t.timestamps
    end
  end
end
