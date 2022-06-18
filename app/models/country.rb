class Country < ApplicationRecord
  has_many :universities, dependent: :destroy
  has_many :unihub_applications

  validates :name, presence: true
end
