class AddIndexToMetrics < ActiveRecord::Migration[5.2]
  def change
    add_index :metrics, :category
  end
end
