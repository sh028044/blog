class Post < ActiveRecord::Base
  belongs_to :user
  paginates_per 2
  has_many :comments
end
