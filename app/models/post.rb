class Post < ApplicationRecord
  belongs_to :category
  validates :title, :content, :catergory_id, presence: true
end
