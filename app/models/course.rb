require 'carrierwave'
require 'carrierwave/orm/activerecord'

class Course < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :locations
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :name, presence: true, length: {minimum: 8}
  validates :prerequisite, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 8}
end
