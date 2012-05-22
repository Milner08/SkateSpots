class AddStyleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :style, :string
  end
end
