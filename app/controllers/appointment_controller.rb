class AppointmentController < ApplicationController
    def index
        @appointments=Appointment.where(user_id: current_user.id)
        if @appointments.empty?
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
        send_data(@report.report.download)
    end

    private
    def appointment_params
      params.require(:doctor).permit(:doctor_id,:appointment_datetime,:report)
    end
end
