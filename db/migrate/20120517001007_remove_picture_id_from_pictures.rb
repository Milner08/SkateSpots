class RemovePictureIdFromPictures < ActiveRecord::Migration
  def change
  	remove_column :pictures, :picture_id
  end
end
