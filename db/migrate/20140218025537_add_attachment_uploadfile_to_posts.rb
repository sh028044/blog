class AddAttachmentUploadfileToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :uploadfile
    end
  end

  def self.down
    drop_attached_file :posts, :uploadfile
  end
end
