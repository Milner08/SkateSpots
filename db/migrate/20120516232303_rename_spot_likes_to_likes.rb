class RenameSpotLikesToLikes < ActiveRecord::Migration
  def change
        rename_table :spot_likes, :likes
  end 
end
