class CreateMechanicsRidesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :mechanics, :rides do |t|
      # t.index [:mechanic_id, :ride_id]
      # t.index [:ride_id, :mechanic_id]
    end
  end
end
