class RemoveBankFromChores < ActiveRecord::Migration
  def change
    remove_column :chores, :bank
    
  end

  
end
