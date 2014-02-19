class Post < ActiveRecord::Base
  belongs_to :user
  paginates_per 2
  has_many :comments
  has_attached_file :uploadfile,:styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :uploadfile, :content_type => /.*/
end
