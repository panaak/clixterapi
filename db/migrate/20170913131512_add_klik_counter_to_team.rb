class AddKlikCounterToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :kliks_count, :integer, default: 0
  end
end
