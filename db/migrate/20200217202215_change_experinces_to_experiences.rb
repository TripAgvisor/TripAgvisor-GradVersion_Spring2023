class ChangeExperincesToExperiences < ActiveRecord::Migration[6.0]
  def change
    rename_table :experinces, :experiences
  end
end
