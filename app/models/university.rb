class University < ApplicationRecord
  has_many :images, as: :imageable
  has_and_belongs_to_many :courses
  has_many :unihub_applications

  belongs_to :country
  validates :name, presence: true
end
