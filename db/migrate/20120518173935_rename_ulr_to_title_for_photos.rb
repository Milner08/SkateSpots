class RenameUlrToTitleForPhotos < ActiveRecord::Migration
  def change
  	rename_column :photos, :url, :title
  end
end
