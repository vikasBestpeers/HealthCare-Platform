class AppointmentController < ApplicationController
    def index
        @user=Appointment.find_by_user_id(current_user.id)
        if @user!=nil
            @doctor=Doctor.find(@user.doctor_id)
        else
            @doctor=nil
        end
    end
    
    def create
        @user=User.find(current_user.id)
        @appointment=@user.appointments.new(appointment_params)
        if @appointment.save
            redirect_to appointment_index_path
        end
    end

    def download
        @report=Appointment.find(params[:id])
        @report.avatar.download
    end

    private
    def appointment_params
      params.require(:doctor).permit(:doctor_id,:appointment_datetime,:avatar)
    end
end
