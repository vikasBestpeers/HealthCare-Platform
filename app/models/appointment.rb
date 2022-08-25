class Appointment < ApplicationRecord
    has_one_attached :report

    belongs_to :user
end
