class AddBlogblockRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :blogblock, index: true
  end
end
