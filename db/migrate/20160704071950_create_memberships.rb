class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :s_name, default: ""
      t.date :s_date
      t.date :s_birth
      t.string :s_type, default: ""
      t.string :category, default: [nil, nil, nil, nil, nil, nil]
      t.integer :user_id
      t.string :phone

      t.timestamps null: false
    end
  end
end
