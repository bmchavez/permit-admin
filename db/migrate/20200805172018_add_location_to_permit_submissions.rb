class AddLocationToPermitSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :permit_submissions, :location, :string
  end
end
