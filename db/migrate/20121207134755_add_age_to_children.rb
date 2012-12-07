class AddAgeToChildren < ActiveRecord::Migration
  def change
    add_column :children, :age, :integer, default: 0
  end
end
