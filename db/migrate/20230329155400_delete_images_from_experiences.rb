class DeleteImagesFromExperiences < ActiveRecord::Migration[6.0]
  def change
    remove_column :experiences, :images
  end
end
