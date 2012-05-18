class RenamePicturesToPhotos < ActiveRecord::Migration
  def change
  	rename_table :pictures, :photos
  end
end
