class Course < ApplicationRecord
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :category, presence: true, length: { maximum: 140 }
  validates :location, presence: true, length: { maximum: 140 }
end
