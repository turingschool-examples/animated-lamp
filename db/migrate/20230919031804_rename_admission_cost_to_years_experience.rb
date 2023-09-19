class RenameAdmissionCostToYearsExperience < ActiveRecord::Migration[7.0]
  def change
    rename_column :mechanics, :admission_cost, :years_experience
  end
end
