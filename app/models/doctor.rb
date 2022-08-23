class Doctor < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :surname, presence: true
    validates :specialization, presence: true
    validates :experience, presence: true

end
