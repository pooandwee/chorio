class AddTotalToChildren < ActiveRecord::Migration
  def change
    add_column :children, :total, :integer, default: 0
  end
end
