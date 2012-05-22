class RenameTypeToSpotTypeInSpots < ActiveRecord::Migration
  def change
  	rename_column :spots, :type, :spotType
  end
end
