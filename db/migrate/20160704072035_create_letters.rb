class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :title
      t.string :content
      t.integer :category_id
      t.date :l_date

      t.timestamps null: false
    end
  end
end
