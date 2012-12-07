class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :image
      t.boolean :rewarded, default: false
      t.integer :costs
      t.integer :child_id

      t.timestamps
    end
  end
end
