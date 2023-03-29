class AddImageToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :image, :string
  end
end
