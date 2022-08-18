class DoctorController < ApplicationController
    def index
      @user=current_user
        @doctor=Doctor.find_by_user_id(@user)
        if @doctor==nil
            redirect_to new_doctor_path
        end
      @appointments=Appointment.where(doctor_id: @user.id)
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
        @details = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(doctor_params)
          redirect_to seller_index_path
        else
          render :edit
        end
    end


    private
    def doctor_params
      params.require(:doctor).permit(:name,:surname,:experience,:specialization)
    end

end
