class HomeController < ApplicationController
    def index
        if user_signed_in?
            if current_user.role == 'Doctor'
                redirect_to doctor_index_path 
            else
                redirect_to patient_index_path
            end
        end
    end
end
