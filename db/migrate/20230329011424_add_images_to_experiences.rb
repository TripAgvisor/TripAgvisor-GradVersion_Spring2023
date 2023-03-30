class AddImagesToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :images, :json
  end
end
