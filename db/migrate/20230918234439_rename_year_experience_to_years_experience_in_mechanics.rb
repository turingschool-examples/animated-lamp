class RenameYearExperienceToYearsExperienceInMechanics < ActiveRecord::Migration[7.0]
  def change
    rename_column :mechanics, :year_experience, :years_experience
  end
end
