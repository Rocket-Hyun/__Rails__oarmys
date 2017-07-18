class AddColumsToLetter < ActiveRecord::Migration
  def change
    add_column :letters, :image_url, :string, default: ""
    add_column :letters, :image_origin, :string, default: ""
  end
end
