class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name
      t.integer :points
      t.boolean :completed, default: false
      t.integer :child_id
      t.date :due_date

      t.timestamps
    end
  end
end
