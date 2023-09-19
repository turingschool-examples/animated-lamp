class CreateRideMechanics < ActiveRecord::Migration[7.0]
  def change
    create_table :ride_mechanics do |t|
      t.references :mechanic, null: false, foreign_key: true
      t.references :ride, null: false, foreign_key: true

      t.timestamps
    end
  end
end
