class AppointmentController < ApplicationController
    def index
        @user=Appointment.find_by_user_id(current_user.id)
        @doctor=Doctor.find(@user.doctor_id)
    end
    
    def create
        @user=User.find(current_user.id)
        @appointment=@user.appointments.new(appointment_params)
        if @appointment.save
            redirect_to appointment_index_path
        end
    end
    
    
    private
    def appointment_params
      params.require(:doctor).permit(:doctor_id,:appointment_datetime)
    end
end
