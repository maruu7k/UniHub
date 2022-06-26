class University < ApplicationRecord
  has_many :images, as: :imageable
  has_and_belongs_to_many :degrees
  has_many :unihub_applications
  has_many :courses

  belongs_to :country
  validates :name, presence: true
end
