class Addnametometrics < ActiveRecord::Migration[5.2]
  def change
    add_column :metrics, :name, :string
  end
end
