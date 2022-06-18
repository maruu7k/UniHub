class Image < ApplicationRecord
  has_one_attached :image, dependent: :destroy

  belongs_to :imageable, polymorphic: true
end
