class AddUserToWorkstationReference < ActiveRecord::Migration[5.2]
  def change
    add_reference :workstations, :user
  end
end
