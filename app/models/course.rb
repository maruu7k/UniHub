class Course < ApplicationRecord
  has_and_belongs_to_many :universities
  has_many :unihub_applications
end
