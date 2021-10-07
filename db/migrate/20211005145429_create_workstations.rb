class CreateWorkstations < ActiveRecord::Migration[5.2]
  def change
    create_table :workstations do |t|
      t.string :name

      t.timestamps
    end
  end
end
