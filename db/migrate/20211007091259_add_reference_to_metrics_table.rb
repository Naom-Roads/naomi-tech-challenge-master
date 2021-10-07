class AddReferenceToMetricsTable < ActiveRecord::Migration[5.2]
  def change
    add_reference :metrics, :workstation
  end
end
