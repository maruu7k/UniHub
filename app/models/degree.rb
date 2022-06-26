class Degree < ApplicationRecord
  has_and_belongs_to_many :universities
  has_and_belongs_to_many :courses

  has_many :unihub_applications
end
