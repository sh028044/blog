class CreateJoinTableUserBlogblock < ActiveRecord::Migration
  def change
    create_join_table :users, :blogblocks do |t|
      # t.index [:user_id, :blogblock_id]
      # t.index [:blogblock_id, :user_id]
    end
  end
end
