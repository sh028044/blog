class AddCreatorToBlogblock < ActiveRecord::Migration
  def change
    add_column :blogblocks, :creator, :string
  end
end
