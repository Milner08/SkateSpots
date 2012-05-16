class CreateSpotLikes < ActiveRecord::Migration
  def change
    create_table :spot_likes do |t|
      t.integer :user_id
      t.integer :spot_id

      t.timestamps
    end

    add_index :spot_likes, :user_id
    add_index :spot_likes, :spot_id
    add_index :spot_likes, [:user_id, :spot_id], unique: true
  end
end
