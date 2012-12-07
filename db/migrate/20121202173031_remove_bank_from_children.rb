class RemoveBankFromChildren < ActiveRecord::Migration
  def up
    remove_column :children, :bank
  end

  def down
    add_column :children, :bank
  end
end
