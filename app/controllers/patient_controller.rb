class PatientController < ApplicationController
    def index
        @user=current_user
        @patient=Patient.find_by_user_id(@user)
        if @patient==nil
            redirect_to new_patient_path
        end
        @doctors=Doctor.all
    end
    
    def new
        @patient=Patient.new
    end

    def create
        @user=current_user 
        @patient=@user.patients.new(patient_params)
        byebug
        if @patient.save
        redirect_to  patient_index_path
        else
            render :new
        end
    end
    
    def search
        if params[:search].blank?
            redirect_to patient_index_path
        else
            if params[:role]=="Specialization"
                @parameter=params[:search]
                @results=Doctor.where(specialization: @parameter)
            else
                @parameter=params[:search]
                @results=Doctor.where(experience: @parameter)
            end

            if@results.first==nil
                redirect_to patient_index_path
            end
        end
    end 

    private
    def patient_params
      params.require(:patient).permit(:name,:surname)
    end

   
end
