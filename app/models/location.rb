class Location < ApplicationRecord
  validates :name, presence: true, length: {maximum: 60}
end
