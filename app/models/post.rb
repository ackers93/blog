class Post < ApplicationRecord
  belongs_to :category
  validates :title, :content, :catergory_id, presence: true
  has_many :line_items, inverse_of: :order
end
