class Course < ApplicationRecord
  has_and_belongs_to_many :degrees
  has_many :unihub_applications

  belongs_to :university
end
