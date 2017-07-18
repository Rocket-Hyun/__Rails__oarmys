class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.string :content
      t.integer :level
      #level0:공지사항 / level1:자주묻는질문 / level2:문의게시판
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
