class CreateSlotCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :slot_collections do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :capacity
      t.integer :slot_id
    end
  end
end
