class CreateBlogblocks < ActiveRecord::Migration
  def change
    create_table :blogblocks do |t|
      t.string :name

      t.timestamps
    end
  end
end
