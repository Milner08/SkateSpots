class ModifyVotes < ActiveRecord::Migration
  def change
  	remove_column :votes, :upvote
  	remove_column :votes, :downvote
  	add_column :votes, :like, :boolean
  end
end
