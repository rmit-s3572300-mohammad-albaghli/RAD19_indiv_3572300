class Course < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :locations
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
end
