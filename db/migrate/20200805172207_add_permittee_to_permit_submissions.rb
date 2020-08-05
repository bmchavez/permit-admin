class AddPermitteeToPermitSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :permit_submissions, :permittee, :string
  end
end
