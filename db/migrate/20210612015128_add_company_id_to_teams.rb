class AddCompanyIdToTeams < ActiveRecord::Migration[6.1]
  def change
    add_reference :teams, :company, index: true
  end
end
