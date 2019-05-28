class Category < ApplicationRecord
  has_and_belongs_to_many :courses
  validates :name, presence: true, length: {maximum: 60}, uniqueness: { case_sensitive: false }
end
