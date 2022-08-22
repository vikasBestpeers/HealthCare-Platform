class User < ApplicationRecord
  has_many :doctors
  has_many :patients
  has_many :appointments

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
