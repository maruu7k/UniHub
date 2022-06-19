class UserMailer < ApplicationMailer
  def new_application_submitted_admin(app_id)
    @unihub_application = UnihubApplication.find(app_id)

    mail(to: ADMIN_EMAIL, subject: 'You got a new application!')
  end

  def contact_form_submitted_admin(contact_id)
    @contact = Contact.find(contact_id)

    mail(to: ADMIN_EMAIL, subject: 'You got a new query!')
  end
end
