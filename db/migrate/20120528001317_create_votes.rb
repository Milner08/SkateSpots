class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :upvote
      t.integer :downvote
      t.string :voteable_type
      t.integer :votable_id
      t.integer :user_id

      t.timestamps
    end
  end
end
