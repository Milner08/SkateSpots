class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :user_id
      t.integer :spot_id

      t.timestamps
    end
    add_index :reviews, [:spot_id, :created_at]
  end
end
