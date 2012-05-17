class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.integer :spot_id
      t.integer :picture_id
      t.text :description

      t.timestamps
    end
  end
end
