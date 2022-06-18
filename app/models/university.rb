class University < ApplicationRecord
  has_many :images, as: :imageable

  belongs_to :country
  validates :name, presence: true
end
