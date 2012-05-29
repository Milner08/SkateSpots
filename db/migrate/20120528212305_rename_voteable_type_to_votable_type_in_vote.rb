class RenameVoteableTypeToVotableTypeInVote < ActiveRecord::Migration
  def change
  	rename_column :votes, :voteable_type, :votable_type
  end
end
