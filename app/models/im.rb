class Im < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  
  validates :real_name, presence: true, length: { maximum: 20 }
  validates :career, presence: true, length: { maximum: 1000 }
  validates :pastime, presence: true, length: { maximum: 2000 }
  validates :one_point, presence: true, length: { maximum: 20 }
  

end
