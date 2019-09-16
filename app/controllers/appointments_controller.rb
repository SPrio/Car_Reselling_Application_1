class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end
 def new
 end
 def schedule
 	#binding.pry
 	@appointment = Appointment.find(params[:id])
 	
 end

 def save_schedule
 	#binding.pry
 	@appointment = Appointment.find(params[:id])
 	@appointment.status = "investigating"
 	@appointment.date=params[:appointment][:date]
 	#binding.pry
 	if @appointment.save!
    @user = User.find(@appointment.user_id)
 		Notification.create(recipient: @user, action: "Your appointment scheduled at #{@appointment.date}", notifiable: @appointment)
 		redirect_to details_appointment_path(@appointment)
 	end
 end

 def destroy
 	@appointment = Appointment.find(params[:id])
    @appointment.destroy
    #generate_flash "Car Brand has been succesfully destroyed"
    redirect_to appointments_path
 end

 def create     
  @appointment = Appointment.new(appointment_params)
 
  if @contact.save
   redirect_to contact_path(@contact)
  else
   render 'index'
  end
 end
 def update 
 	@appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      flash[:notice] = "It has been succesfully Updated"
      #redirect_to car_brands_path
    else
      flash[:notice] = "Failed to update"
      #render "edit"
    end
  end

 def show
  @appointment = Appointment.find(params[:id])
 end

 
  def details
  	@appointment = Appointment.find(params[:id])
  end
  private
	def appointment_params     
	 params.require(:appointment).permit(:date)
	end 
end
