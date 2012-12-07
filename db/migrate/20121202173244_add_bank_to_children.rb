class AddBankToChildren < ActiveRecord::Migration
  def change
    add_column :children, :bank, :integer, :default => 0
  end
end
