class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :unihub_applications, dependent: :destroy
  has_one_attached :image

  def name
    "#{first_name} #{last_name}"
  end
end
