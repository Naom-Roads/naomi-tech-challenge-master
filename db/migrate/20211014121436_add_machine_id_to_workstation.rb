class AddMachineIdToWorkstation < ActiveRecord::Migration[5.2]
  def change
    add_column :workstations, :machine_id, :uuid
  end
end
