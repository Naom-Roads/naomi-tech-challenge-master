class CreateMetrics < ActiveRecord::Migration[5.2]
  def change
    create_table :metrics do |t|
      t.string :category
      t.string :value
      t.uuid :machine_id

      t.timestamps
    end
  end
end
