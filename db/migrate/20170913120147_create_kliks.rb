class CreateKliks < ActiveRecord::Migration[5.1]
  def change
    create_table :kliks do |t|
      t.references :team, foreign_key: true
      t.string :session

      t.timestamps
    end
  end
end
