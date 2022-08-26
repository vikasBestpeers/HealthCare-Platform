class DoctorController < ApplicationController
    def index
      @user=current_user
      @doctor=Doctor.find_by_user_id(@user.id)
        if @doctor==nil
            redirect_to new_doctor_path
        else
          @appointments=Appointment.where(doctor_id: @doctor.id)
        end
    end

    def new
        @doctor=Doctor.new
    end

    def create
        @user=current_user 
        @doctor=@user.doctors.new(doctor_params)
        if @doctor.save
        redirect_to  doctor_index_path
        else
            render :new
        end
    end


    def edit
        @details = Doctor.find_by_user_id(params[:id])
    end
    
    def update

        @doctor = Doctor.find(params[:id])
        if @doctor.update(doctor_params)
          redirect_to doctor_index_path
        else
          render :edit
        end
    end


    private
    def doctor_params
      params.require(:doctor).permit(:name,:surname,:experience,:specialization)
    end

end
