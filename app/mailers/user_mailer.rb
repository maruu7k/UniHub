class UserMailer < ApplicationMailer
  def new_application_submitted_admin(id)
    @unihub_application = UnihubApplication.find(id)

    mail(to: ADMIN_EMAIL, subject: 'You got a new application!')
  end
end
