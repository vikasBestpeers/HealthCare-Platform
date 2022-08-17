class PatientController < ApplicationController
    def index
        @doctors=Doctor.all
    end
    

    def create
        byebug
        @user=current_user
        @doctor=Doctor.find(params[:id])
        byebug
        byebug
        @appointment=@user.appointments.create(appointment_params)
        if @appointment.save
            byebug
            redirect_to patient_index_path
        end
    end

    private
    def appointment_params
      params.require(:appointment).permit(:doctor_id)
    end
end
