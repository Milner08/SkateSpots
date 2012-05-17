class AddUrlToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :url, :string
  end

  add_index :pictures, :user_id
  add_index :pictures, :spot_id
  add_index :pictures, :picture_id
end
