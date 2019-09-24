class UserMailer < ApplicationMailer
	def statusupdate(user_mail,ap_status)
    @user_mail = user_mail
    @ap_status = ap_status
    mail(to: @user_mail, subject: 'Appointment Status Update')
  end
end
