class AddEquipmentToPermitSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :permit_submissions, :equipment, :string
  end
end
