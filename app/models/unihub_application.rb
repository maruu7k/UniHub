class UnihubApplication < ApplicationRecord
  has_many_attached :file

  belongs_to :user
  belongs_to :country
  belongs_to :university
  belongs_to :degree
  belongs_to :course

  enum status: {
    submitted: 0,
    processing: 1,
    university_accepted: 2,
    visa_processing: 3,
    visa_approved: 4
  }

  enum current_qualification: {
    intermediate: 0,
    bachelors: 1,
    masters: 2
  }
end
