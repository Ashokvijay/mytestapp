class CreateDraftOrders < ActiveRecord::Migration
  def change
    create_table :draft_orders do |t|
      t.integer :round
      t.integer :pick
      t.integer :team_id

      t.timestamps
    end
  end
end
